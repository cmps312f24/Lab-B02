import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _textFieldValue1 = 'what ever I write here will be displayed here';

  @override
  void initState() {
    _textFieldValue1 = "I was changed in  the init state";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Tutorial '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _textFieldValue1 = value;
                });
              },
              decoration: InputDecoration(
                  // suffixIcon: const Icon(Icons.search),
                  // prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
            ),
          ),
          Text(
            _textFieldValue1,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
