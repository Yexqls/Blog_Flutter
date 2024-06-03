import 'package:blog_aplication/widgets/publications_page.dart';
import 'package:blog_aplication/widgets/user_page.dart';
import 'package:flutter/material.dart';

class MyPublicationsUser extends StatelessWidget {
  const MyPublicationsUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mis Posts',
      debugShowCheckedModeBanner: false, // Ocultar la etiqueta DEBUG
      initialRoute: '/',
      routes: {
        '/': (context) => MisPostsScreen(),
        '/posts': (context) => MyPublications(),
        '/perfil': (context) => MyUser(),
      },
    );
  }
}

class MisPostsScreen extends StatefulWidget {
  @override
  _MisPostsScreenState createState() => _MisPostsScreenState();
}

class _MisPostsScreenState extends State<MisPostsScreen> {
  int _selectedIndex = 1; // Inicialmente seleccionamos el botón "Perfil"

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/posts');
        break;
      case 1:
        // Ya estamos en la pantalla de Mis Posts, no hacemos nada
        break;
      case 2:
        Navigator.pushNamed(context, '/perfil');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mis Posts',
      debugShowCheckedModeBanner: false, // Ocultar la etiqueta DEBUG
      home: Scaffold(
        backgroundColor: Color(0xFF1E1E1E),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50), // Margen entre la parte superior y el primer card
            Center(
              child: Container(
                width: 300,
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Image.asset(
                        'images/theLegendOfZelda.jpg',
                        width: 300,
                        height: 150,
                        fit: BoxFit.cover,
                      ), // Ensure this image is in your assets folder
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'The Legend of Zelda',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'El juego que traspasó generaciones',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            // Edit action
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.white),
                          onPressed: () {
                            // Delete action
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black, // Fondo negro para la barra inferior
          selectedItemColor: Colors.white, // Color blanco para el texto e íconos seleccionados
          unselectedItemColor: Colors.white60, // Color blanco opaco para el texto e íconos no seleccionados
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add new post action
          },
          backgroundColor: Colors.white,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.add, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
