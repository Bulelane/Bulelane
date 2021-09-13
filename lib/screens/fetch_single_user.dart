import 'package:flutter/material.dart';
import 'package:project/apis/company_api.dart';
import 'package:project/models/company.dart';

class FetchCurrent extends StatefulWidget {
  @override
  _FetchCurrentState createState() => _FetchCurrentState();
}

class _FetchCurrentState extends State<FetchCurrent> {
  Future<Company> futureAlbum;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Company>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data.name),
                    Text(snapshot.data.id.toString()),
                    Text(snapshot.data.email),
                    Text(snapshot.data.telephone),
                    Text(snapshot.data.country),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
