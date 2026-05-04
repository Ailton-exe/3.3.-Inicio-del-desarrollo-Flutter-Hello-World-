import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaClima(),
    );
  }
}

// 🔹 FUNCIÓN HTTP
Future<Map<String, dynamic>> obtenerClima(String ciudad) async {
  final apiKey = "3de8ef278e5b2b67e30c4b14f33ce5f7"; // 👈 PON AQUÍ TU API KEY

  final url = Uri.parse(
    "https://api.openweathermap.org/data/2.5/weather?q=$ciudad&appid=$apiKey&units=metric&lang=es"
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Error al obtener el clima");
  }
}

// 🔹 PANTALLA PRINCIPAL
class PantallaClima extends StatefulWidget {
  @override
  _PantallaClimaState createState() => _PantallaClimaState();
}

class _PantallaClimaState extends State<PantallaClima> {
  String ciudad = "Guadalajara";
  String resultado = "Presiona el botón para consultar el clima";

  void consultarClima() async {
    try {
      final data = await obtenerClima(ciudad);

      setState(() {
        resultado =
            "${data['name']}\n${data['main']['temp']}°C\n${data['weather'][0]['description']}";
      });
    } catch (e) {
      setState(() {
        resultado = "Error al obtener datos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clima con API"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              resultado,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: consultarClima,
              child: Text("Consultar clima"),
            ),
          ],
        ),
      ),
    );
  }
}