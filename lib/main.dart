import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // variable privada se declara con _
  int _numClicks = 0;

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday card'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Permite a un widget reconocer gestos
          GestureDetector(
            onTap: () {
              _numClicks++;
              // Operador cascade en Dart ..
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Felicitado $_numClicks veces"),
                  ),
                );
            },
            child: Text(
              "Happy birthday Frank",
              style: TextStyle(fontSize: 38),
            ),
          ),
          // Expande y toma todo el contenido disponible en una columna o fila
          Expanded(
            child: Image.network(
              "https://thumbs.dreamstime.com/b/happy-birthday-cupcake-celebration-message-160558421.jpg",
            ),
          ),
          // Alinea a un widget en caso de haber espacio disponible
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "From Mike",
              style: TextStyle(fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
