import 'package:flutter/material.dart';

class Utils {
  // Coinbase pro websocket: wss://ws-feed.pro.coinbase.com
  // More info here: https://docs.pro.coinbase.com/

  // API used for market data: https://developer.bitaps.com/ 
  static String marketDataUrl = "https://api.bitaps.com/market/v1/tickers/COINBASEPRO";

  // API used for bitcoin explorer: https://github.com/Blockstream/esplora/blob/master/API.md
  static String blocksUrl = "https://blockstream.info/api/blocks/";
  static String transactionsUrl = "https://blockchain.info/unconfirmed-transactions?format=json";

  static TextStyle headerStyle = TextStyle(
    color: Colors.grey,
    fontSize: 15,
  );

  static TextStyle listHeaderStyle = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  static TextStyle tabHeaderStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static Widget buildSearchTextField({
    TextEditingController textEditingController,
    String hintText,
    Function onSumbitted,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        constraints: BoxConstraints(),
        child: TextField(
          onSubmitted: onSumbitted,
          controller: textEditingController,
          decoration: InputDecoration(
            fillColor: Colors.grey[900],
            filled: true,
            prefixIconConstraints: BoxConstraints(minWidth: 40, minHeight: 40),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: const BorderRadius.all(
                const Radius.circular(50.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
