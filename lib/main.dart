import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(         
        title: const Center(
          child: Text('Vinil Sentimental'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Aquí se mostraría el menú de navegación')),
              );
            },
          ),
        ],
      ),


      body: Stack(
         children: [
                    // Fondo
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://planisferio.com.mx/wp-content/uploads/2025/08/mujer-cubrio-cara-disco-vinilo-retro-entonado_77190-7218.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.music_note, size: 50, color: Colors.white),
                const SizedBox(height: 16),
                const Text(
                  '¡Bienvenido a Vinil Sentimental!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,                    
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    
                  ),
                  onPressed: () {
                    print('Agregar vinil');
                  },
                  child: Text(
                    'Agregar nuevo vinil',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],                
      ),
    );
  }
}