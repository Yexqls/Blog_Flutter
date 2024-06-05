import 'package:blog_aplication/widgets/home.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro',
      debugShowCheckedModeBanner: false, // Ocultar la etiqueta DEBUG
      initialRoute: '/',
      routes: {
        '/': (context) => RegistrationUserScreen(),
        '/Login': (context) => MyHome(),
      },
    );
  }
}

class RegistrationUserScreen extends StatefulWidget {
  @override
  _RegistrationUserScreenState createState() => _RegistrationUserScreenState();
}

class _RegistrationUserScreenState extends State<RegistrationUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear usuario'),
        backgroundColor: Color.fromARGB(255, 62, 192, 37),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/Login');
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 37, 55, 48),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.white,
                ),
                SizedBox(height: 16.0),
                Text(
                  'REGISTRO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Por favor ingrese estos datos para continuar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                _buildTextField(
                  icon: Icons.person,
                  hintText: 'Nombre de usuario',
                ),
                SizedBox(height: 8.0),
                _buildTextField(
                  icon: Icons.email,
                  hintText: 'Correo electrónico',
                ),
                SizedBox(height: 8.0),
                _buildTextField(
                  icon: Icons.lock,
                  hintText: 'Contraseña',
                  obscureText: true,
                ),
                SizedBox(height: 8.0),
                _buildTextField(
                  icon: Icons.lock,
                  hintText: 'Confirmar contraseña',
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Fondo del botón
                      foregroundColor: Colors.black, // Color del texto
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Login'); 
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('REGISTRARSE'),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String hintText,
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
      ),
    );
  }
}
