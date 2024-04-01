import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SafeArea Example'),
        ),
        body: MySafeAreaBody(),
      ),
    );
  }
}

class MySafeAreaBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  // Inside your _MyHomePageState class
  FocusScopeNode _scopeNode = FocusScopeNode();
  bool _showAccessory = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _showAccessory = _focusNode.hasFocus;
      });
    });
  }

  Widget _buildKeyboardAccessory() {
    return Container(
      height: 40,
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              // Your 'Done' button action here
              _textController.clear(); // Example: Clear textfield
              FocusScope.of(context).unfocus(); // Dismiss keyboard
            },
            child: Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... (Rest of your Scaffold)
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FocusScope(
          node: _scopeNode,
          child: Column(
            children: [
              TextField(
                controller: _textController,
                focusNode: _focusNode,
                decoration: InputDecoration(hintText: 'Enter some text'),
              ),
              if (_showAccessory) _buildKeyboardAccessory(),
            ],
          ),
        ),
      ),
    );
  }

  // ... _buildKeyboardAccessory() remains the same
}
