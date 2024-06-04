import 'package:flutter/material.dart';

class EditPost extends StatefulWidget {
  const EditPost({super.key});

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<EditPost> {
  String? _selectedPlatform;
  final TextEditingController _gameNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double topImageHeight = screenHeight / 4;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Editar post'),
        backgroundColor: Color.fromARGB(255, 62, 192, 37),
      ),
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Handle image selection
              },
              child: Container(
                height: 257,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _gameNameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nombre del juego',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Descripción',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text('CATEGORIAS DE PLATAFORMA',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Column(
              children: [
                RadioListTile<String>(
                  title: Text(
                    'PC',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: 'PC',
                  groupValue: _selectedPlatform,
                  onChanged: (value) {
                    setState(() {
                      _selectedPlatform = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text(
                    'XBOX',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: 'XBOX',
                  groupValue: _selectedPlatform,
                  onChanged: (value) {
                    setState(() {
                      _selectedPlatform = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text(
                    'NINTENDO',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: 'NINTENDO',
                  groupValue: _selectedPlatform,
                  onChanged: (value) {
                    setState(() {
                      _selectedPlatform = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text(
                    'MÓVIL',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: 'MÓVIL',
                  groupValue: _selectedPlatform,
                  onChanged: (value) {
                    setState(() {
                      _selectedPlatform = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text(
                    'PS',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: 'PS',
                  groupValue: _selectedPlatform,
                  onChanged: (value) {
                    setState(() {
                      _selectedPlatform = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle publish button press
              },
              child: Text(
                'PUBLICAR',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
