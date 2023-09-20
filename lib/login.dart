import 'package:flutter/material.dart';
import 'package:mykenderaan/gagalmasuk.dart';
import 'package:mykenderaan/homepage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //declare variables
  final noicController = TextEditingController();
  final passwordController = TextEditingController();

  //function
  checkLogin(String noIC, String password) {
    if (noIC == '1234' && password == '1234') {
      //boleh masuk
      print('boleh Masuk');
      //pergi ke homepage
      MaterialPageRoute route =
          MaterialPageRoute(builder: (context) => const Homepage());
      Navigator.push(context, route);
    } else {
      print('Gagal, tak boleh Masuk');
      MaterialPageRoute route =
          MaterialPageRoute(builder: (context) => const GagalMasuk());
      Navigator.push(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Pengguna'),
              ),
              Container(
                width: 315,
                height: 560,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 234, 234, 234),
                  //Set the container's background color
                  borderRadius:
                      BorderRadius.circular(15), // Set the border radius
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Log Masuk',
                        style: TextStyle(fontSize: 40),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.network(
                        'https://seeklogo.com/images/J/jabatan-pendaftaran-negara-jpn-logo-01B38BCB56-seeklogo.com.png',
                        width: 160,
                        height: 145,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: noicController,
                        decoration: const InputDecoration(
                          label: Text('No IC'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          label: Text('Kata Laluan'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              //code sini
                              checkLogin(
                                  noicController.text, passwordController.text);
                            },
                            child: const Text('Masuk')),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





