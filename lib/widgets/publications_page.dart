import 'package:blog_aplication/widgets/mypublications_page.dart';
import 'package:blog_aplication/widgets/user_page.dart';
import 'package:flutter/material.dart';

class MyPublications extends StatelessWidget {
  const MyPublications({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Ocultar la etiqueta DEBUG
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/perfil': (context) => MyUser(),
        '/MisPosts': (context) => MyPublicationsUser(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Inicialmente seleccionamos el botón "Perfil"
  List<bool> _liked = [false, false, false]; // Estado del color del icono

  void _onItemTapped(int index) {
    // setState(() {
    //   _selectedIndex = index; // Verifica el estado para cambiar de color el texto e icono del boton seleccionado
    // });

    switch (index) {
      case 0:
        // Ya estamos en la pantalla de posts, no hacemos nada
        break;
      case 1:
        Navigator.pushNamed(context, '/MisPosts');
        break;
      case 2:
        Navigator.pushNamed(context, '/perfil');
        break;
    }
  }

  void _toggleIconColor(int index) {
    setState(() {
      _liked[index] = !_liked[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF1E1E1E), // Fondo general de la aplicación
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height:
                        50), // Margen entre la parte superior y el primer card
                // Card 1
                Card(
                  color: Color(0xFF4A4949), // Color de fondo del card
                  child: Container(
                    width: 300,
                    height: 300,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Image.asset(
                            'images/clashRoyale.jpg',
                            width: 300,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Clash Royale',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          subtitle: Text('Vic01',
                              style: TextStyle(color: Colors.white)),
                          trailing: Icon(
                            Icons.thumb_up,
                            color: _liked[0] ? Colors.blue : Colors.white,
                          ),
                          onTap: () {
                            _toggleIconColor(0);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Batallas multijugador épicas',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Card 2
                Card(
                  color: Color(0xFF4A4949), // Color de fondo del card
                  child: Container(
                    width: 300,
                    height: 300,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Image.asset(
                            'images/marioBros.jpg',
                            width: 300,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Mario Bros',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          subtitle: Text('Yucli03',
                              style: TextStyle(color: Colors.white)),
                          trailing: Icon(
                            Icons.thumb_up,
                            color: _liked[1] ? Colors.blue : Colors.white,
                          ),
                          onTap: () {
                            _toggleIconColor(1);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Mario Bros, un personaje de leyenda',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Card 3
                Card(
                  color: Color(0xFF4A4949), // Color de fondo del card
                  child: Container(
                    width: 300,
                    height: 300,
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
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'The Legend of Zelda',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          subtitle: Text('Yucli03',
                              style: TextStyle(color: Colors.white)),
                          trailing: Icon(
                            Icons.thumb_up,
                            color: _liked[2] ? Colors.blue : Colors.white,
                          ),
                          onTap: () {
                            _toggleIconColor(2);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'The Legend of Zelda, el juego que cambió la historia',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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