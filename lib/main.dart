import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Actividad de Widgets'),
        ),
      ),
      body: Column(
        children: [
          // CONTAINER + TEXT
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.blue,
            child: Text(
              'Texto de prueba dentro de una columna',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),

          // ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.home, size: 50),
              Icon(Icons.search, size: 50),
              Icon(Icons.settings, size: 50),
              Icon(Icons.account_circle, size: 50),
            ],
          ),

          // STACK
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: Colors.purple[800],
                ),
                Positioned(
                  top: 50,
                  left: 50,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green[400],
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: 50,
                  child: Text(
                    'Stack de prueba',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}