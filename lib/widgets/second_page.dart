import 'package:blog_aplication/widgets/home.dart';
import 'package:blog_aplication/widgets/user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
        '/myuser': (context) => MyUser(),
      },
    );
  }
}

class RegistrationUserScreen extends StatefulWidget {
  @override
  _RegistrationUserScreenState createState() => _RegistrationUserScreenState();
}

class _RegistrationUserScreenState extends State<RegistrationUserScreen> {
  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
    else{
      mostrarDialogoAdvertencia(context, 'Error', 'Las contraseñas no coinciden, vuelve a intentar.');
    }
  }

  bool passwordConfirmed() {
    if(_passwordController.text.trim() == 
       _confirmpasswordController.text.trim()){
      return true;
    }
    else{
      return false;
    }
  }

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
                  controller: _usernameController,
                  icon: Icons.person,
                  hintText: 'Nombre de usuario',
                ),
                SizedBox(height: 8.0),
                _buildTextField(
                  controller: _emailController,
                  icon: Icons.email,
                  hintText: 'Correo electrónico',
                ),
                SizedBox(height: 8.0),
                _buildTextField(
                  controller: _passwordController,
                  icon: Icons.lock,
                  hintText: 'Contraseña',
                  obscureText: true,
                ),
                SizedBox(height: 8.0),
                _buildTextField(
                  controller: _confirmpasswordController,
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
                      onTap: signUp();
                      if(passwordConfirmed()){
                        Navigator.pushNamed(context, '/Login');
                      }
                      
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
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
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

void mostrarDialogoAdvertencia(BuildContext context, String titulo, String contenido) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(titulo, textAlign: TextAlign.center),
        content: Text(contenido, textAlign: TextAlign.center),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    },
  );
}