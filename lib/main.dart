import 'package:flutter/material.dart';
import 'package:project/company_list.dart';
import 'package:project/delete_example.dart';
import 'package:project/fetch_single_company.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: CompanyListPage(),
      )
    );
  }
}

