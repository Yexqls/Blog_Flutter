import 'package:blog_aplication/widgets/mypublications_page.dart';
import 'package:blog_aplication/widgets/publications_page.dart';
import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  String? _selectedPlatform;
  final TextEditingController _gameNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nuevo Post',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false, // Ocultar la etiqueta DEBUG
      routes: {
        '/': (context) => NewPostScreen(),
        '/MisPosts': (context) => MyPublicationsUser(),
        '/posts': (context) => MyPublications(),
      },
    );
  }
}

class NewPostScreen extends StatefulWidget {
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  String? _selectedPlatform;
  final TextEditingController _gameNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/MisPosts');
          },
        ),
        title: Text('Nuevo post'),
        backgroundColor: Color.fromARGB(255, 62, 192, 37),
      ),
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  // Handle image selection
                },
                child: Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image, size: 50),
                        Text('SELECCIONA UNA IMAGEN'),
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
              Text(
                'CATEGORIAS DE PLATAFORMA',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
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
                  Navigator.pushNamed(context, '/posts');
                },
                child: Text(
                  'PUBLICAR',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}