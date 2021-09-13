// import 'package:flutter/material.dart';
// import 'package:project/apis/company_api.dart';
// import 'package:project/company_details.dart';
// import 'package:project/models/company.dart';

// class CompanyListPage extends StatefulWidget {
//   @override
//   _CompanyListPageState createState() => _CompanyListPageState();
// }

// class _CompanyListPageState extends State<CompanyListPage> {
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController telephone = TextEditingController();
//   TextEditingController country = TextEditingController();
//   TextEditingController id = TextEditingController();

//   var companyAPI = new CompanyAPI();
//   @override
//   Widget build(BuildContext context) {
//     Future<Company> _futureCompany;
//     initState() {
//       super.initState();
//       _futureCompany = CompanyAPI().fetchCompany();
//     }

//     //var companyAPI = new CompanyAPI();
//     return Padding(
//       padding: EdgeInsets.all(10),
//       child: FutureBuilder(
//         future: companyAPI.findAll(),
//         builder: (context, AsyncSnapshot<List> snapshot) {
//           if (snapshot.hasData) {
//             return Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: ListView.builder(
//                       itemCount: snapshot.data.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           child: ListTile(
//                             title: Text(snapshot.data[index].name),
//                             subtitle: Text(snapshot.data[index].id),
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => CompanyDetailsPage(
//                                             id: snapshot.data[index].id,
//                                           )));
//                             },
//                           ),
//                         );
//                       }),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     color: Colors.orange[50],
//                     child: Padding(
//                       padding: const EdgeInsets.all(32.0),
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 TextField(
//                                   controller: name,
//                                   decoration: InputDecoration(
//                                     hintText: "Name",
//                                   ),
//                                 ),
//                                 TextField(
//                                   controller: email,
//                                   decoration: InputDecoration(
//                                     hintText: "Email",
//                                   ),
//                                 ),
//                                 TextField(
//                                   controller: telephone,
//                                   decoration: InputDecoration(
//                                     hintText: "Telephone",
//                                   ),
//                                 ),
//                                 TextField(
//                                   controller: country,
//                                   decoration: InputDecoration(
//                                     hintText: "Country",
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 16.0,
//                                 ),
//                                 FloatingActionButton(
//                                   onPressed: () async {
//                                     final Company user = await CompanyAPI()
//                                         .addCompany(name.text, email.text,
//                                             telephone.text, country.text);
//                                   },
//                                   child: Icon(Icons.add),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                               child: Column(
//                             children: [
//                               TextField(
//                                 controller: id,
//                                 decoration: InputDecoration(
//                                   hintText: "Id",
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 32.0,
//                               ),
//                               Center(
//           child: FutureBuilder<Company>(
//             future: _futureCompany,
//             builder: (context, snapshot) {
//               // If the connection is done,
//               // check for response data or an error.
//               if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.hasData) {
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(snapshot.data?.name ?? 'Deleted'),
//                       ElevatedButton(
//                         child: const Text('Delete Data'),
//                         onPressed: () {
//                           setState(() {
//                             _futureCompany =
//                                 CompanyAPI().deleteCompany((snapshot.data.id.toString()));
//                           });
//                         },
//                       ),
//                     ],
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text("${snapshot.error}");
//                 }
//               }

//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//                             ],
//                           ))
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:project/apis/company_api.dart';
import 'package:project/screens/company_details.dart';
import 'package:project/models/company.dart';

class CompanyListPage extends StatefulWidget {
  @override
  _CompanyListPageState createState() => _CompanyListPageState();
}

class _CompanyListPageState extends State<CompanyListPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController id = TextEditingController();

  var companyAPI = new CompanyAPI();
  @override
  Widget build(BuildContext context) {

    //var companyAPI = new CompanyAPI();
    return Padding(
      padding: EdgeInsets.all(10),
      child: FutureBuilder(
        future: companyAPI.findAll(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(snapshot.data[index].name),
                            subtitle: Text(snapshot.data[index].id),
                            onTap: () {
                              print(snapshot.data[index].id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CompanyDetailsPage(
                                    id: snapshot.data[index].id,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                ),
                AddCompanyWidget(name: name, email: email, telephone: telephone, country: country)
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class AddCompanyWidget extends StatelessWidget {
  const AddCompanyWidget({
    Key key,
    @required this.name,
    @required this.email,
    @required this.telephone,
    @required this.country,
  }) : super(key: key);

  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController telephone;
  final TextEditingController country;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.orange[50],
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                        hintText: "Name",
                      ),
                    ),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Email",
                      ),
                    ),
                    TextField(
                      controller: telephone,
                      decoration: InputDecoration(
                        hintText: "Telephone",
                      ),
                    ),
                    TextField(
                      controller: country,
                      decoration: InputDecoration(
                        hintText: "Country",
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    FloatingActionButton(
                      onPressed: () async {
                        final Company user = await CompanyAPI()
                            .addCompany(name.text, email.text,
                                telephone.text, country.text);
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
