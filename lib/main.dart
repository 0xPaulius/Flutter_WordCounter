import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WordCounterPage(),
    );
  }
}

class WordCounterPage extends StatefulWidget {
  @override
  _WordCounterPageState createState() => _WordCounterPageState();
}

class _WordCounterPageState extends State<WordCounterPage> {
  int wordCount = 0;
  int symbolCount = 0;

  void updateCounts(String text) {
    setState(() {
      symbolCount = text.length;
      wordCount = text.trim().split(' ').where((word) => word.isNotEmpty).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Counter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Type text here>>>',
                border: OutlineInputBorder(),
              ),
              onChanged: updateCounts,
            ),
            SizedBox(height: 20),
            Text('Word count: $wordCount'),
            Text('Symbol count: $symbolCount'),
          ],
        ),
      ),
    );
  }
}
