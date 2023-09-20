import 'package:flutter/material.dart';
import 'package:mykenderaan/borangduahala.dart';
import 'package:mykenderaan/borangsehala.dart';

class MohonKenderaan extends StatefulWidget {
  const MohonKenderaan({super.key});

  @override
  State<MohonKenderaan> createState() => _MohonKenderaanState();
}

class _MohonKenderaanState extends State<MohonKenderaan> {

  int index = 0;
  List borang = [const BorangSehala(), const BorangDuahala()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mohon Kenderaan'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      //code utk sehala
                      setState(() {
                        index = 0;
                      });
                    },
                    child: const Text('Sehala')),
                TextButton(
                    onPressed: () {
                      //code utk dua hala
                      setState(() {
                        index = 1;
                      });
                    },
                    child: const Text('Dua hala'))
              ],
            ),
            Container(
              width: 300,
              height: 900,
              child: borang[index],
            )
            
          ],
        ),
      ),
    );
  }
}
