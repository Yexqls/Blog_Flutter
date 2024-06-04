import 'package:blog_aplication/routes/routes.dart';
import 'package:blog_aplication/widgets/mypublications_page.dart';
import 'package:blog_aplication/widgets/publications_page.dart';
import 'package:flutter/material.dart';

class MyUser extends StatelessWidget {
  const MyUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false, // Ocultar la etiqueta DEBUG
      initialRoute: '/',
      routes: {
        '/': (context) => ProfileScreen(),
        '/posts': (context) => MyPublications(),
        '/MisPosts': (context) => MyPublicationsUser(),
        '/EditarPerfil': (context) => ThirdPage(),
        '/Login': (context) => MyHome(),
      },
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 2; // Inicialmente seleccionamos el botón "Perfil"

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/posts');
        break;
      case 1:
        Navigator.pushNamed(context, '/MisPosts');
        break;
      case 2:
        // Ya estamos en la pantalla de perfil, no hacemos nada
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double circleRadius = 80.0;
    final double topImageHeight = screenHeight / 4;
    final double circleDiameter = circleRadius * 2;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 63, 164, 66),
              Color.fromARGB(255, 5, 102, 8),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: topImageHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'images/fondoVideojuegos.jpg'), // Ruta de tu imagen
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: topImageHeight - circleRadius,
              left: MediaQuery.of(context).size.width / 2 - circleRadius,
              child: CircleAvatar(
                radius: circleRadius,
                backgroundImage: AssetImage(
                    'images/perfilProfesor.jpg'), // Ruta de tu imagen
              ),
            ),
            Positioned.fill(
              top: topImageHeight + circleRadius,
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Vic01',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Vic01@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/EditarPerfil');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      icon: Icon(Icons.edit, color: Colors.black),
                      label: Text('EDITAR DATOS',
                          style: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Login'); // Handle Close Session button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_forward),
                          SizedBox(width: 10),
                          Text('CERRAR SESIÓN'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Fondo negro para la barra inferior
        selectedItemColor:
            Colors.white, // Color blanco para el texto e íconos seleccionados
        unselectedItemColor: Colors
            .white60, // Color blanco opaco para el texto e íconos no seleccionados
        currentIndex: _selectedIndex, // Ítem actualmente seleccionado
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Mis Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
