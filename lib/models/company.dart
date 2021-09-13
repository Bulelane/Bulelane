import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
  Company({
    this.id,
    this.name,
    this.email,
    this.telephone,
    this.country,
  });

  String id;
  String name;
  String email;
  String telephone;
  String country;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json['id'].toString() ,
        name: json["name"] ,
        email: json["email"] ,
        telephone: json["telephone"] ,
        country: json["country"] ,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "telephone": telephone,
        "country": country,
      };
}
