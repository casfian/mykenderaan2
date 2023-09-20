import 'package:flutter/material.dart';
import 'package:mykenderaan/models/tempahan.dart';
import 'package:mykenderaan/wakilpenumpang.dart';

class BorangSehala extends StatefulWidget {
  const BorangSehala({super.key});

  @override
  State<BorangSehala> createState() => _BorangSehalaState();
}

class _BorangSehalaState extends State<BorangSehala> {
  final tarikh_pergiController = TextEditingController();
  final masa_pergiController = TextEditingController();
  final destinasi_dariController = TextEditingController();
  final destinasi_keController = TextEditingController();
  final tujuanController = TextEditingController();
  final kategori_penumpangController = TextEditingController();
  final bilangan_penumpangController = TextEditingController();
  final catatanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text('Borang Sehala'),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
            controller: tarikh_pergiController,
            decoration: const InputDecoration(
              label: Text('Tarikh Pergi'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
            controller: masa_pergiController,
            decoration: const InputDecoration(
              label: Text('Masa Pergi'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
            controller: destinasi_dariController,
            decoration: const InputDecoration(
              label: Text('Destinasi Dari'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
            controller: destinasi_keController,
            decoration: const InputDecoration(
              label: Text('Destinasi Ke'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
            controller: tujuanController,
            decoration: const InputDecoration(
              label: Text('Tujuan'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
            controller: kategori_penumpangController,
            decoration: const InputDecoration(
              label: Text('Kategori Penumpang'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
            controller: bilangan_penumpangController,
            decoration: const InputDecoration(
              label: Text('Bilangan Penumpang'),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        TextField(
          maxLines: 3,
          controller: catatanController,
          decoration: const InputDecoration(
            label: Text('Catatan'),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            //code
            Tempahan tempahborangsehala = Tempahan(
                '',
                tarikh_pergiController.text,
                masa_pergiController.text,
                '',
                '',
                destinasi_dariController.text,
                destinasi_keController.text,
                false,
                tujuanController.text,
                kategori_penumpangController.text,
                bilangan_penumpangController.text,
                catatanController.text,
                '',
                '',
                '');

            MaterialPageRoute route = MaterialPageRoute(
                builder: (context) => WakilPenumpang(
                      passBorang: tempahborangsehala,
                    ));
            Navigator.push(context, route);
          },
          child: const Text('Seterusnya'),
        ),
      ]),
    );
  }
}
