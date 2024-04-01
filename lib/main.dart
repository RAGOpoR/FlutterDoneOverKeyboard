import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';


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
          title: Text('Done Button Example'),
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
        child: MyCustomTextField(),
      ),
    );
  }
}

class MyCustomTextField extends StatefulWidget {
  @override
  _MyCustomTextFieldState createState() => _MyCustomTextFieldState();
}

class _MyCustomTextFieldState extends State<MyCustomTextField> {
  FocusNode _focusNode = FocusNode();
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    var keyboardVisibilityController = KeyboardVisibilityController();
    // Subscribe to keyboard visibility changes
    keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() => _isKeyboardVisible = visible);
    });
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      // Optionally reset your widget's state here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        TextField(
          focusNode: _focusNode,
          decoration: InputDecoration(hintText: 'Tap here...'),
        ),
        Positioned(
          bottom: _isKeyboardVisible ? MediaQuery.of(context).viewInsets.bottom : 0,
          right: 0,
          child: _isKeyboardVisible ? _buildDoneButton() : Container(),
        ),
      ],
    );
  }

  Widget _buildDoneButton() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        child: Text('Done'),
        onPressed: () {
          _focusNode.unfocus();
        },
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}

