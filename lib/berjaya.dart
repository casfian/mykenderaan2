import 'package:flutter/material.dart';
import 'package:mykenderaan/homepage.dart';

class Berjaya extends StatelessWidget {
  const Berjaya({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berjaya Hantar'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
                width: 300,
                height: 100,
                child: Text(
                  'Pemohonan berjaya dihantar.Proses pemohanan anda akan diketahuai dalam masa 3 hari.',
                  textAlign: TextAlign.justify,
                )),
            OutlinedButton(
                onPressed: () {
                  //code
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (context) => const Homepage());
                  Navigator.pushAndRemoveUntil(
                      context, route, (route) => false);
                },
                child: const Text('Kembali Dashboard'))
          ],
        ),
      ),
    );
  }
}
