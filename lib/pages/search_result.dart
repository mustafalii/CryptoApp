import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  final String searchString;
  SearchResult(this.searchString);
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Result"),
      ),
      body: Container(
        child: Text("Nothing here"),
      ),
    );
  }
}
