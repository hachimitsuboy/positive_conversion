import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:positive_conversion/data_class/csv_data.dart';
import 'package:positive_conversion/view/next_page.dart';

class ResultPage extends StatefulWidget {
  final CsvData? maxValueWord;

  ResultPage({this.maxValueWord});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "計算結果",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 38,
          ),
          Text(
            "最もポジティブ値の高い用語",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            (widget.maxValueWord != null)
                ? "「${widget.maxValueWord!.kanji}」"
                : "0を超えるポジティブ値をもつ類語が見つかりませんでした",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 55,
          ),
          Center(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 32.0,
                      ),
                      Text(
                        "ポジティブ値",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        (widget.maxValueWord != null)
                            ? widget.maxValueWord!.value.toString()
                            : "0",
                        style: TextStyle(fontSize: 32.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                //TODO
                onPressed: () => toNextPage(context),
                child: Text("トップへ戻る"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen,
                  onPrimary: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

toNextPage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => NextPage(),
    ),
  );
}
