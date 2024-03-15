import 'login_page.dart';
import 'package:flutter/material.dart';
import 'package:appSchool/pages/chamada_page.dart';
import 'package:appSchool/pages/home_page.dart';

class ProfessorPage extends StatefulWidget {
  const ProfessorPage({super.key});

  @override
  ProfessorPageState createState() => ProfessorPageState();
}

class ProfessorPageState extends State<ProfessorPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(58, 141, 192, 1),
        title: const Text(
          'José Carlos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout_outlined, 
              color: Colors.white,
              size: 25,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150,60),
              ),
              child: const Text('Escola e Turma'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChamadaPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150,60)),
              child: const Text('Chamada'),
            )
          ],
        ),
      ),
    );
  }
}
