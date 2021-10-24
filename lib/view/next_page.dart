import 'package:flutter/material.dart';
import 'package:positive_conversion/view/count_number_page.dart';


class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ポジティブ変換",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
            ),
            Text(
              "あなたのネガティブな一面は？",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: _textEditingController,
              ),
            ),
            SizedBox(
              height: 38.0,
            ),
            //TODO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () => _toCountNumberPage(context),
                  child: Text(
                    "変換",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _toCountNumberPage(BuildContext context) {
    if(_textEditingController.text != ""){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CountNumberPage(
            word: _textEditingController.text,
          ),
        ),
      );
    }

  }
}
