import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:async';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('English Words'),),
      body: randomWords(),
    );
  }
}




class _randomWordsState extends State<randomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // itemCount: _suggestions.length,
        itemBuilder: (context, i){
          // _suggestions.addAll(generateWordPairs().take(10));
          if(i.isOdd) return const Divider();
          final index = i ~/ 2;
          if(index >= _suggestions.length){
                _suggestions.addAll(generateWordPairs().take(10));
          }
          return ListTile(
            title:  Text(_suggestions[index].asPascalCase, style: _biggerFont,),
          );
        }
    );
  }
}

class randomWords extends StatefulWidget {
  const randomWords({Key? key}) : super(key: key);

  @override
  State<randomWords> createState() => _randomWordsState();
}



