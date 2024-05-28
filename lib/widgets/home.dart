import 'package:flutter/material.dart';
import 'package:blog_aplication/routes/routes.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fondo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Container(
                width: 200,
                height: 150,
                child: Image.asset(
                  'images/mando.png', // Aquí reemplaza con la ruta de tu imagen
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'LOGIN DE LA CUEVA DEL GAMER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: MyForm(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
