import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/authfunction.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _formkey = GlobalKey<FormState>();
  String email = " ";
  String Password = " ";
  String Username = " ";
  bool islogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Email/Pass auth",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              islogin
                  ? Container()
                  : TextFormField(
                      key: ValueKey('email'),
                      decoration: InputDecoration(
                          hintText: 'enter email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                      validator: (value) {
                        if (!value.toString().contains('@')) {
                          return "Invalid Email";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          email = value.toString();
                        });
                      },
                    ),
              TextFormField(
                key: ValueKey('username'),
                decoration: InputDecoration(
                    hintText: 'enter username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
                validator: (value) {
                  if (value.toString().length < 4) {
                    return "user name is small";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    Username = value.toString();
                  });
                },
              ),
              TextFormField(
                key: ValueKey('password'),
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'enter password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
                validator: (value) {
                  if (value.toString().length < 8) {
                    return "paswword is small";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    Password = value.toString();
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    if (signup(email, Password) == "200") {
                      islogin = true;
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.amber),
                  elevation: WidgetStateProperty.all<double>(
                      0), // Set your desired elevation here
                ),
                child: Text(
                  islogin ? "Log in" : "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      islogin = !islogin;
                    });
                  },
                  child: islogin
                      ? Text("Don't have account ? signup")
                      : Text("Have a account ? Login"))
            ],
          ),
        ),
      ),
    );
  }
}
