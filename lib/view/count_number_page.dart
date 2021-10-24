import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:flutter/services.dart' show rootBundle;
import 'package:positive_conversion/data_class/csv_data.dart';

class CountNumberPage extends StatefulWidget {
  final String word;

  CountNumberPage({required this.word});

  @override
  _CountNumberPageState createState() => _CountNumberPageState();
}

class _CountNumberPageState extends State<CountNumberPage> {
  // 最終的にはAPIから取得したユーザーIDを渡せば良さそう

  String title = "";
  String url = "";
  String searchWord = "";
  Uri target = Uri();

  List<String> _result = [];

  @override
  void initState() {
    super.initState();
    url = "https://renso-ruigo.com/word/";
    searchWord = widget.word;
    url = url + searchWord;
    target = Uri.parse(url);
    print("URL: $target");

    _getWord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: _result.isNotEmpty
            ? WordCard(
                resultList: _result,
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () => _getValue(),
      ),
    );
  }

  _getWord() async {
    final response = await http.get(target);

    // 下の行のコメントを外すことで、返されたHTMLを出力できる。

    // ステータスコードをチェックする。「200 OK」以外のときはその旨を表示して終了する。
    if (response.statusCode != 200) {
      print('ERROR: ${response.statusCode}');
      return;
    }

    final document = parse(response.body);
    var getSynonyms = document
        .querySelectorAll("#ruigogun_paragraph-1 > a ")
        .map((e) => e.text)
        .toList();

    if (getSynonyms.length == 0) {
      //#content > div.main_word_table_set.view_mode_no_member > div > div.word_t_field.view_mode_no_member > div > a:nth-child(2)
      getSynonyms = document
          .querySelectorAll(" div.word_t_field.view_mode_no_member > div > a ")
          .map((e) => e.text)
          .toList();

      print("getSynonyms: $getSynonyms");
    }

    setState(() {
      _result = getSynonyms;
      title = "${widget.word}の類語: 合計 ${_result.length.toString()} 語";
    });
  }

  _getValue() async {
    print("押された");
    //ファイルのロード＋文字一致判断
    loadAsset().then((value) {

    });
  }
}

Future<List<CsvData>> loadAsset() async {
  List<CsvData> valueList = [];
  //csvデータ読み込み
  String csv = await rootBundle.loadString('assets/text/dictionary.csv');
  //csvデータを1行ずつ処理
  for (String line in csv.split("\n")) {
    //コロン区切りで各列のデータを配列に格納
    print("Line:$line");
    List rows = line.split(",");

    CsvData rowData = CsvData(
      kanji: rows[0],
      hiragana: rows[1],
      verb: rows[2],
      value: double.parse(rows[3]),
    );
    valueList.add(rowData);
  }
  return valueList;
}

// 類語群を表示するWidget
class WordCard extends StatelessWidget {
  final List<String> resultList;

  const WordCard({
    required this.resultList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: resultList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 20,
            color: Colors.white70,
            child: ListTile(
              leading: Text(
                (index + 1).toString(),
                style: TextStyle(fontSize: 22),
              ),
              title: Text(resultList[index]),
            ),
          ),
        );
      },
    );
  }
}
