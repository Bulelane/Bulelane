import 'package:flutter/material.dart';
import 'package:project/apis/company_api.dart';
import 'package:project/models/company.dart';

import '../main.dart';

class CompanyDetailsPage extends StatefulWidget {
  String id;

  CompanyDetailsPage({Key key, this.id}) : super(key: key);

  @override
  _CompanyDetailsPageState createState() => _CompanyDetailsPageState();
}

class _CompanyDetailsPageState extends State<CompanyDetailsPage> {
  
  @override
  Widget build(BuildContext context) {
    var companyAPI = new CompanyAPI();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(60.0),
        child: Center(
          child: FutureBuilder(
            future: companyAPI.find(widget.id),
            builder: (context, AsyncSnapshot<Company> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data.id.toString()),
                    SizedBox(height: 32.0,),
                    Text(snapshot.data.name),
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(snapshot.data.email),
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(snapshot.data.telephone),
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(snapshot.data.country),
                    SizedBox(
                      height: 32.0,
                    ),
                    RaisedButton(onPressed: (){
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  MyApp(),
                        ),
                      );
                    },child: Text('Back'),)
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
