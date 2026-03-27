import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Welcome to flutter"),
          )
        ),
        body: const Center(
          child: Text("Hello World"),
        ),
      )
    )
  );
}