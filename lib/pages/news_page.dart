import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List _newsData = [];
  // bool _dataGot = false;
  // int _articleCount = 0;
  // eb632193384348238d832abb8e6ae41b
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    http
        .get(Uri.parse(
            "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=eb632193384348238d832abb8e6ae41b"))
        .then((res) {
      var resBody = utf8.decode(res.bodyBytes);
      var resJson = json.decode(resBody);
      print(resJson);
      setState(() {
        _newsData = resJson["articles"];
        // _articleCount = resJson["totalResults"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _newsData.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                _launchUrl(_newsData[index]["url"]);
              },
              trailing: Container(
                  width: 100,
                  height: 80,
                  child: _newsData[index]["urlToImage"] != null
                      ? Image.network(
                          _newsData[index]["urlToImage"],
                          fit: BoxFit.cover,
                        )
                      : Container()),
              title: Text(
                _newsData[index]["title"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                _newsData[index]["description"],
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
            );
          },
        ),
      ),
    );
  }

  void _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) throw "Could not launch $url";
  }
}
