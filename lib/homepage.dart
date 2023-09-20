import 'package:flutter/material.dart';
import 'package:mykenderaan/mohonkenderaan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List kenderaan = [];

  Future<dynamic> getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      kenderaan = jsonResponse;
      print(kenderaan);
      return kenderaan;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        actions: [
          IconButton(
              onPressed: () {
                //code sini
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) => const MohonKenderaan());
                Navigator.push(context, route);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(snapshot.data[index]['userId'].toString()),
                    title: Text(snapshot.data[index]['title']),
                    subtitle: Text(snapshot.data[index]['body']),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    ));
  }
}



// ListView.builder(
//             itemCount: kenderaan.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(kenderaan[index]),
//                 onTap: () {
//                   //code utk padam
//                   setState(() {
//                     kenderaan.removeAt(index);
//                   });
//                 },
//               );
//             },
//           )),