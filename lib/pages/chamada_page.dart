import 'package:flutter/material.dart';
//import 'package:seduc_app/pages/home_page.dart';
import 'package:seduc_app/pages/teacher_page.dart';
//import 'package:flutter_easyloading/flutter_easyloading.dart';

class ChamadaPage extends StatefulWidget {
  const ChamadaPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChamadaPageState createState() => _ChamadaPageState();
}

class _ChamadaPageState extends State<ChamadaPage> {
  final List<String> _alunos = [
    'Antonio Carlos Sobrinho',
    'Maria Jose Anchieta',
    'Jose Marcos Macieira',
    'Mario Padilha Freitas',
    'Marcio Pimentel Machado',
    'Gabriela Helena Delgado de Queirós',
    'Valdirene Neves Ortega',
    'Cláudia Brito Faria',
    'Suely Zenaide Jimenes Leon',
    'Arnaldo Galhardo de Neves',
    'Igor Galvão do Rio',
    'Emanuel Brito de Padilha',
    'Gisele Brito de Salazar',
    'Raul Ferreira Leon',
    'Damares Quésia Abreu de Lutero',
    'Camila Núbia de Maldonado'
  ];

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(_alunos.length, false);
  }

  void selectAll() {
    setState(() {
      if (_isChecked.contains(false)) {
        _isChecked = List<bool>.filled(_alunos.length, true);
      } else {
        _isChecked = List<bool>.filled(_alunos.length, false);
      }
    });
  }

  List<bool> _isChecked = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(58, 141, 192, 1),
        title: const Text('Lista de alunos'),
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(58, 141, 192, 1),
              ),
              onPressed: selectAll,
              child: const Text('Selecionar Todos')
              ,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _alunos.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    side: BorderSide(
                      color: const Color.fromARGB(255, 6, 6, 6).withOpacity(0.7),
                      width: 0.5,
                    ),
                  ),
                  child: ListTile(
                    dense: true,
                    leading: Checkbox(
                      value: _isChecked[index],
                      onChanged: (val) {
                        setState(() {
                          _isChecked[index] = val!;
                        });
                      },
                    ),
                    title: Text(_alunos[index]),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 28),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Salvar'),
                      content: const Text('Tem certeza?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'Cancelar');
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircularProgressIndicator(),
                                      SizedBox(height: 16),
                                      Text('Salvando...'),
                                    ],
                                  ),
                                );
                              },
                            );
                            Future.delayed(const Duration(seconds: 2), () {
                              Navigator.pop(context); // Fecha o primeiro diálogo
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.check,
                                            color: Colors.green, size: 48),
                                        SizedBox(height: 25),
                                        Text('Salvo com sucesso!'),
                                      ],
                                    ),
                                  );
                                },
                              );
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.pop(context); // Fecha o segundo diálogo
                                Navigator.pop(context); // Fecha o diálogo após simular o envio
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context) => const ProfessorPage()
                                  )
                                );
                              });
                            });
                          },
                          child: const Text('Salvar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Salvar'),
            ),
          ),
        ],
      ),
    );
  }
}
