import 'package:flutter/material.dart';
import 'package:gentr/years.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'info.dart';
import 'recover.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loading = ValueNotifier<bool>(false);
  final siape = TextEditingController();
  final senha = TextEditingController();

  @override
  void initState() {
    inicializar();
    super.initState();
  }

  void inicializar() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    siape.text = (pref.getString("siape") ?? '');
    senha.text = (pref.getString("senha") ?? '');
    setState(() {
      siape.text;
      senha.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ListTile(
          title: const Text(
            'Gerenciador de Entregas',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          trailing: GestureDetector(
            child: const Icon(
              Icons.info_outline,
              size: 25,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListTilesWidget(),
                ),
              );
            },
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 2,
              child: ClipRect(
                child: Image.asset(
                  'img/logo.png',
                  height: 80,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                ),
              ),
              shadowColor: Colors.red,
            ),
            const Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                controller: siape,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  labelText: 'Siape',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 222, 105, 66),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 222, 105, 66),
                      width: 1,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 222, 105, 66),
                      width: 1,
                    ),
                  ),
                  icon: Icon(
                    Icons.people,
                    size: 20,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                controller: senha,
                obscureText: true,
                obscuringCharacter: '*',
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 222, 105, 66),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 222, 105, 66),
                      width: 1,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 222, 105, 66),
                      width: 1,
                    ),
                  ),
                  icon: Icon(
                    Icons.password,
                    size: 20,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 120,
                  margin: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                    ),
                    onPressed: () async {
                      try {
                        loading.value = !loading.value;
                        var dio = Dio();

                        var login = await dio.post(
                          'http://201.15.116.228/users/login',
                          data: {
                            'siape': siape.text,
                            'password': senha.text,
                            'tipo': 'mb^J@mPrDM',
                          },
                        );

                        if (login.data != null) {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          await pref.setString("siape", siape.text);
                          await pref.setString("senha", senha.text);

                          var jsonLogin = convert.jsonDecode(login.data);

                          if (jsonLogin['nome'] != 'Erro') {
                            var anos = await dio.post(
                              'http://201.15.116.228/mobile/anos',
                              data: {
                                'serial': jsonLogin['serial'],
                              },
                            );

                            List<int> anosCad = [];

                            if (anos.data == '[]') {
                              setState(() {
                                loading.value = !loading.value;
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Years(
                                    nomeProf: jsonLogin['nome'],
                                    anosCad: anosCad,
                                    serialCadastrado: jsonLogin['serial'],
                                  ),
                                ),
                              );
                            } else {
                              var jsonAnos = convert.jsonDecode(anos.data);

                              if (jsonAnos[0] != 'Erro') {
                                for (var item in jsonAnos) {
                                  int ano = int.parse(item);
                                  anosCad.add(ano);
                                }
                                setState(() {
                                  loading.value = !loading.value;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Years(
                                      nomeProf: jsonLogin['nome'],
                                      anosCad: anosCad,
                                      serialCadastrado: jsonLogin['serial'],
                                    ),
                                  ),
                                );
                              } else {
                                loading.value = !loading.value;
                                mensagem(jsonAnos);
                              }
                            }
                          } else {
                            loading.value = !loading.value;
                            mensagem(jsonLogin['serial']);
                          }
                        } else {
                          //erro no login.data
                          loading.value = !loading.value;
                          mensagem('Erro na requisi????o');
                        }
                      } catch (e) {
                        setState(() {
                          loading.value = false;
                        });
                        mensagem('Erro na requisi????o');
                      }
                    },
                    child: AnimatedBuilder(
                      animation: loading,
                      builder: (context, _) {
                        return loading.value
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  backgroundColor:
                                      Color.fromARGB(255, 222, 105, 66),
                                ),
                              )
                            : const Text(
                                "Entrar",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Recover(),
                          ),
                        );
                      },
                      child: const Text(
                        'Recuperar senha',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 222, 105, 66),
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void mensagem(String msg) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            msg,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Fechar',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
