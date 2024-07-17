import 'package:clean_arch_app/domain/usecases/login_user.dart';
import 'package:clean_arch_app/presentation/pages/master_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final int minPasswordLength = 8;
  bool _isPasswordVisible = false;
  bool isChecked = false;

  void snackbarMessage(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      final loginUser = GetIt.instance<LoginUser>();
      final success = await loginUser.execute(
        _usernameController.text,
        _passwordController.text,
      );
      if (success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DanfePage()),
        );
      } else {
        setState(() {
          snackbarMessage(
            context,
            'Usuário ou senha inválidos',
            Colors.red,
          );
        });
      }
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Expanded(
                flex: constraints.maxWidth < 800 ? 2 : 1,
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: 'Usuário',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira seu usuário';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                labelText: 'Senha',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: _togglePasswordVisibility,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira sua senha';
                                } else if (value.length < minPasswordLength) {
                                  return 'A senha deve ter pelo menos $minPasswordLength caracteres';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value ?? false;
                                    });
                                  },
                                ),
                                Text('Lembrar de Mim'),
                              ],
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 15),
                                textStyle: TextStyle(
                                    fontSize: 18, color: Colors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Text(
                                'Entrar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 50),
                            Transform.translate(
                              offset: Offset(0, 50),
                              child: Text(
                                'Sistema NFE (Build v1.0)',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (constraints.maxWidth >= 800)
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xffedf0f5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.translate(
                          offset: Offset(0, -100),
                          child: Image.asset(
                            'assets/images/Mindlog_logo.png',
                            height: 300,
                            width: 300,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -150),
                          child: Image.asset(
                            'assets/images/Mindlog_image.png',
                            height: 300,
                            width: 400,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -100),
                          child: Text(
                            'NFE Tech',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -100),
                          child: Text(
                            'Sistema de Extração de Dados',
                            style: TextStyle(
                              fontSize: 25,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
