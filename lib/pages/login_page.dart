import 'package:flutter/material.dart';
import 'package:appSchool/pages/teacher_page.dart';
import 'package:appSchool/components/ctextfield.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final cpf1Controller = MaskedTextController(mask: '000.000.000-00');

  void _login() {
    // Simule um processo de autenticação
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfessorPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40.0, 0, 40.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Image.asset("assets/school.png"),
                const SizedBox(height: 80),
                CTextField(
                  hintText: "CPF",
                  obscureText: false,
                  controller: cpfController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                CTextField(
                  hintText: "Senha",
                  obscureText: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Esqueci a senha",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 90),
                Container(
                  height: 65,
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(58, 141, 192, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: SizedBox.expand(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(58, 141, 192, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: isLoading ? null : _login,
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            ):const Text(
                              "Entrar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
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
}
