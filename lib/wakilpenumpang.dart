import 'package:flutter/material.dart';
import 'package:mykenderaan/berjaya.dart';
import 'package:mykenderaan/gagalhantar.dart';
import 'package:mykenderaan/models/tempahan.dart';
import 'package:http/http.dart' as http;

class WakilPenumpang extends StatefulWidget {
  const WakilPenumpang({super.key, required this.passBorang});

  final Tempahan passBorang;

  @override
  State<WakilPenumpang> createState() => _WakilPenumpangState();
}

class _WakilPenumpangState extends State<WakilPenumpang> {
  final nama_wakilController = TextEditingController();
  final notel_wakilController = TextEditingController();
  final emel_wakilController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wakil Penumpang'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              //utk debugging saja
              Text(widget.passBorang.nama_penempah!),
              Text(widget.passBorang.tarikh_pergi!),
              Text(widget.passBorang.masa_pergi!),
              Text(widget.passBorang.tarikh_balik!),
              Text(widget.passBorang.masa_balik!),
              Text(widget.passBorang.destinasi_dari!),
              Text(widget.passBorang.destinasi_ke!),
              Text(widget.passBorang.pemandu_tunggu.toString()),
              Text(widget.passBorang.tujuan!),
              Text(widget.passBorang.kategori_penumpang!),
              Text(widget.passBorang.bilangan_penumpang!),
              Text(widget.passBorang.catatan!),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: nama_wakilController,
                  decoration: InputDecoration(
                    label: Text('Nama Wakil'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: notel_wakilController,
                  decoration: InputDecoration(
                    label: Text('No Telefon'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: emel_wakilController,
                  decoration: InputDecoration(
                    label: Text('Emel'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    //code
                    Tempahan borangsiap = Tempahan(
                        widget.passBorang.nama_penempah,
                        widget.passBorang.tarikh_pergi,
                        widget.passBorang.masa_pergi,
                        widget.passBorang.tarikh_balik,
                        widget.passBorang.masa_balik,
                        widget.passBorang.destinasi_dari,
                        widget.passBorang.destinasi_ke,
                        widget.passBorang.pemandu_tunggu,
                        widget.passBorang.tujuan,
                        widget.passBorang.kategori_penumpang,
                        widget.passBorang.bilangan_penumpang,
                        widget.passBorang.catatan,
                        nama_wakilController.text,
                        notel_wakilController.text,
                        emel_wakilController.text);

                    var url = Uri.https('http://localhost/mykenderaan/create');
                    var response = await http.post(
                      url, 
                      body: {
                        'nama_penempah': borangsiap.nama_penempah, 
                        'tarikh_pergi': borangsiap.tarikh_pergi,
                        //boleh sambung...
                        });

                    if (response.statusCode == 200) {
                      //200 goto Berjaya
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => const Berjaya());
                    Navigator.push(context, route);
                    } else {
                      //gagal 400, 500
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => const GagalHantar());
                    Navigator.push(context, route);
                    }

                    
                  },
                  child: const Text('Hantar'))
            ],
          ),
        ),
      ),
    );
  }
}
