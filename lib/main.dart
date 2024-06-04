import 'package:blog_aplication/widgets/edit_post.dart';
import 'package:blog_aplication/widgets/home.dart';
import 'package:blog_aplication/widgets/mypublications_page.dart';
import 'package:blog_aplication/widgets/new_post.dart';
import 'package:blog_aplication/widgets/user_page.dart';
import 'package:flutter/material.dart';
import 'package:blog_aplication/routes/routes.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Aplicacion',
      
      //home: MyHome(),
     //home: MyPublicationsUser(),
home: EditPost(),
//home: MyPublications(),
//home: EditPost()
//home: SecondPage(),
    );
  }
}

