import 'dart:async';
import 'dart:convert';
import 'package:crypto_app/models/crypto.dart';
import 'package:crypto_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Markets extends StatefulWidget {
  @override
  _MarketsState createState() => _MarketsState();
}

class _MarketsState extends State<Markets> with AutomaticKeepAliveClientMixin {
  // final WebSocketChannel _channel = WebSocketChannel.connect(
  //   Uri.parse('wss://ws-feed.pro.coinbase.com'),
  // );

  Timer requestTimer;
  Stopwatch tempTimer = Stopwatch();
  final cbpUrl = Uri.parse(Utils.marketDataUrl);
  final _textEditingController = TextEditingController();
  List<Crypto> cryptos = [];
  @override
  void initState() {
    requestTimer = Timer.periodic(Duration(seconds: 50), (timer) async {
      http.Response httpResponse = await http.get(cbpUrl);
      var resposne = json.decode(httpResponse.body);
      Map<String, dynamic> tempData = resposne['data']['COINBASEPRO']['pairs'];
      // tempData holds a map like {<crypto-fiat> : <market data info> }
      cryptos = [];
      tempData.entries.forEach((entry) {
        Crypto tempCrypto = Crypto.fromJson(entry.value);
        tempCrypto = tempCrypto.rebuild((c) => c..name = entry.key);
        if (mounted) {
          setState(() {
            cryptos.add(tempCrypto);
          });
        }
      });
    });
    // Map subscription = {
    //   "type": "subscribe",
    //   "product_ids": ["BTC-USD", "ETH-USD"],
    //   "channels": ['ticker'],
    // };
    // _channel.sink.add(jsonEncode(subscription));
    super.initState();
  }

  @override
  void dispose() {
    // _channel.sink.close();
    _textEditingController?.clear();
    requestTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleSpacing: 10,
        title: Text(
          "Markets",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          child: Utils.buildSearchTextField(
              textEditingController: _textEditingController,
              hintText: "Search"),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text("FIAT MARKETS", style: Utils.headerStyle),
                  Spacer(),
                  Text("24HR", style: Utils.headerStyle),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  addAutomaticKeepAlives: true,
                  shrinkWrap: true,
                  itemCount: cryptos.length,
                  itemBuilder: (context, index) {
                    return _buildCryptoListItem(cryptos[index]);
                  },
                ),
              ),
              // StreamBuilder(
              //   stream: _channel.stream,
              //   builder: (context, snapshot) {
              //     print(snapshot.data);
              //     return Text(snapshot.hasData ? '${snapshot.data}' : '');
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCryptoListItem(Crypto crypto) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                crypto.name,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                formatNumber(crypto.volume),
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                crypto.last.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                crypto.percentChange().toStringAsFixed(2) + '%',
                style: TextStyle(
                    color: crypto.last_change.toString().startsWith('-')
                        ? Colors.red
                        : Colors.green,
                    fontSize: 15),
              )
            ],
          ),
        ],
      ),
    );
  }

  String formatNumber(double vol) {
    String formattedNumber = NumberFormat.compact().format(vol);
    return formattedNumber;
  }

  @override
  bool get wantKeepAlive => true;
}
