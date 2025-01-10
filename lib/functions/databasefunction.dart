import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/functions/firestoredatabase.dart";
import "package:flutter_application_1/pages/pets.dart";

class DataBaseOption extends StatefulWidget {
  const DataBaseOption({super.key});

  @override
  State<DataBaseOption> createState() => _DataBaseOptionState();
}

class _DataBaseOptionState extends State<DataBaseOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout))
        ],
        title: Text("Database Option"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Center(
          child: Column(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    create();
                  },
                  child: Text("Create")),
              ElevatedButton(
                  onPressed: () {
                    update('pets', 'tom', 'age', 20);
                  },
                  child: Text("Update")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PetsList();
                    }));
                  },
                  child: Text("Retrive")),
              ElevatedButton(
                  onPressed: () {
                    delete('pets', 'harry');
                  },
                  child: Text("Delete")),
            ],
          ),
        ),
      ),
    );
  }
}
