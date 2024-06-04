import 'package:flutter/material.dart';
import 'package:blog_aplication/routes/routes.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final String pass = '1234';
  final String usuario = 'yucli';
  final TextEditingController controllerI = TextEditingController();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 500,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 36, 36, 36)),
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Inicio de sesion',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              const Text(
                'Por favor inicie sesion para continuar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              TextFormField(
                controller: controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextFormField(
                controller: controllerI,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  validarCredenciales(
                    context,
                    usuario,
                    pass,
                    controller,
                    controllerI,
                  );
                },
                child: const Text('INICIAR SESIÓN'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage ()),
                  );
                },
                child: Text('CREAR CUENTA', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void mostrarDialogo(BuildContext context, String titulo, String contenido) {
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThirdPage ()),
              );
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    },
  );
}

void validarCredenciales(
  BuildContext context,
  String usuario,
  String pass,
  TextEditingController controller,
  TextEditingController controllerI,
) {
  if (controller.text.isEmpty || controllerI.text.isEmpty) {
    mostrarDialogo(
      context,
      'Error',
      'Por favor, ingrese el usuario y contraseña',
    );
  } else {
    if (controller.text == usuario && controllerI.text == pass) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondPage()),
      );
    } else {
      mostrarDialogo(
        context,
        'Datos incorrectos',
        'El usuario o la contraseña son incorrectos',
      );
    }
  }
}
