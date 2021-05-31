import 'dart:convert';
import 'package:crypto_app/models/block.dart';
import 'package:crypto_app/models/transaction.dart';
import 'package:crypto_app/pages/search_result.dart';
import 'package:crypto_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Explorer extends StatefulWidget {
  @override
  _ExplorerState createState() => _ExplorerState();
}

class _ExplorerState extends State<Explorer>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;
  Uri blocksUrl;
  double screenWidth = 0;
  List<Block> bitcoinBlocks = [];
  List<Transaction> transactions = [];
  bool fetchingBlocks = false;
  bool fetchingTransactions = false;
  final TextEditingController _textEditingController = TextEditingController();
  final Uri transactionsUrl = Uri.parse(Utils.transactionsUrl);
  final RefreshController _blockRefreshController =
      RefreshController(initialRefresh: false);
  final RefreshController _txsRefreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    fetchBlocks();
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        switch (_tabController.index) {
          case 0:
            if (!fetchingBlocks && bitcoinBlocks.length == 0) fetchBlocks();
            break;
          case 1:
            if (!fetchingTransactions && transactions.length == 0)
              fetchTransactions();
            break;
        }
      }
    });
    super.initState();
  }

  Future<void> fetchBlocks({int blockStartHeight = 0}) async {
    if (fetchingBlocks) return;
    if (blockStartHeight == 0) {
      bitcoinBlocks = [];
      blocksUrl = Uri.parse(Utils.blocksUrl);
    } else {
      blocksUrl = Uri.parse(Utils.blocksUrl + blockStartHeight.toString());
    }
    if (mounted) {
      setState(() {
        fetchingTransactions = false;
        fetchingBlocks = true;
      });
    }
    http.Response response = await http.get(blocksUrl);
    List decodedResponse = json.decode(response.body);
    decodedResponse.forEach((blockInfo) {
      Block tempBlock = Block.fromJson(blockInfo);
      bitcoinBlocks.add(tempBlock);
    });
    if (mounted) {
      setState(() {
        fetchingBlocks = false;
        _blockRefreshController.refreshCompleted();
      });
    }
  }

  Future<void> fetchTransactions() async {
    if (fetchingTransactions) return;
    transactions = [];
    if (mounted) {
      setState(() {
        fetchingBlocks = false;
        fetchingTransactions = true;
      });
    }
    http.Response response = await http.get(transactionsUrl);
    var decodedResponse = json.decode(response.body);
    List tempTransactions = List.from(decodedResponse['txs']);
    tempTransactions.forEach((txInfo) {
      // Map<String, String>
      Transaction tempTransaction = Transaction.fromJson(txInfo);
      transactions.add(tempTransaction);
    });
    if (mounted) {
      setState(() {
        fetchingTransactions = false;
        _txsRefreshController.refreshCompleted();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 10,
          title: Text(
            "Bitcoin Explorer",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: false,
          bottom: PreferredSize(
            child: Column(
              children: [
                Utils.buildSearchTextField(
                    textEditingController: _textEditingController,
                    hintText: "Search for block height, hash, or transaction",
                    onSumbitted: (searchString) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SearchResult(searchString),
                        ),
                      );
                    }),
              ],
            ),
            preferredSize: Size.fromHeight(kToolbarHeight),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {});
              },
              controller: _tabController,
              automaticIndicatorColorAdjustment: true,
              tabs: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Blocks",
                    style: Utils.tabHeaderStyle,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Transactions",
                    style: Utils.tabHeaderStyle,
                  ),
                ),
              ],
            ),
            _tabController.index == 0
                ? _buildBlocksList()
                : _buildTransactionsList(),
          ],
        ));
  }

  Widget _buildTransactionsList() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: SmartRefresher(
          onRefresh: fetchTransactions,
          controller: _txsRefreshController,
          child: transactions.length == 0 && fetchingTransactions
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              "TXID",
                              style: Utils.listHeaderStyle,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              "Value",
                              style: Utils.listHeaderStyle,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              "Size",
                              style: Utils.listHeaderStyle,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              "Fee",
                              style: Utils.listHeaderStyle,
                            ),
                          )
                        ],
                      );
                    }
                    Transaction transactionItem = transactions[index - 1];
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                                transactionItem.hash.toString(),
                                extraPadding: EdgeInsets.only(right: 20),
                                onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SearchResult(
                                          transactionItem.hash.toString(),
                                        ),
                                      ),
                                    ),
                                style: TextStyle(
                                  color: Colors.blue,
                                  // decoration: TextDecoration.underline,
                                )),
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              transactionItem.size.toString(),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              transactionItem.fee.toString(),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              transactionItem.fee.toString(),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
        ),
      ),
    );
  }

  Widget _buildBlocksList() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: SmartRefresher(
          controller: _blockRefreshController,
          onRefresh: fetchBlocks,
          child: fetchingBlocks && bitcoinBlocks.length == 0
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  physics: AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.white,
                      indent: 1,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: bitcoinBlocks.length + 2,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              "Height",
                              style: Utils.listHeaderStyle,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              "Transaction",
                              style: Utils.listHeaderStyle,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              "Size (KB)",
                              style: Utils.listHeaderStyle,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              "Weight (KWU)",
                              style: Utils.listHeaderStyle,
                            ),
                          )
                        ],
                      );
                    } else if (index == bitcoinBlocks.length + 1) {
                      return fetchingBlocks
                          ? LinearProgressIndicator()
                          : MaterialButton(
                              onPressed: () {
                                Block lastBlock =
                                    bitcoinBlocks[bitcoinBlocks.length - 1];
                                fetchBlocks(
                                    blockStartHeight: lastBlock.height - 1);
                              },
                              child: Container(
                                  constraints: BoxConstraints(),
                                  child: Text("Load more")),
                            );
                    }
                    Block block = bitcoinBlocks[index - 1];
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              block.height.toString(),
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SearchResult(
                                    block.height.toString(),
                                  ),
                                ),
                              ),
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              block.tx_count.toString(),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              block.size.toString(),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: _buildEqualWidthContainer(
                              block.weight.toString(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  Widget _buildEqualWidthContainer(String str,
      {TextStyle style, Function onTap, EdgeInsetsGeometry extraPadding}) {
    return Container(
      padding: extraPadding,
      constraints: BoxConstraints(maxWidth: screenWidth / 5),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          str,
          style: style,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
