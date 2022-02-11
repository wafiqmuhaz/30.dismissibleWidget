// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class myHome extends StatelessWidget {
  final Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dismissible Widget"),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) {
              print("DISMISS");
              if (direction == DismissDirection.endToStart) {
                print("DARI KANAN KE KIRI");
              } else {
                print("DARI KIRI KE KANAN");
              }
              ;
            },
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("BENERAN?!"),
                    content: Text("Apakah anda yakin ingin menghapusnya?"),
                    actions: <ElevatedButton>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text("YA"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text("TIDAK"),
                      ),
                    ],
                  );
                },
              );
            },
            background: Container(
              padding: EdgeInsets.only(right: 15),
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: Icon(Icons.delete, size: 30),
            ),
            key: Key(
              index.toString(),
            ),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),
                title: Text(faker.person.name()),
                subtitle: Text(
                  faker.lorem.sentence(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
