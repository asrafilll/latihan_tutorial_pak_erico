import 'package:flutter/material.dart';
import 'package:hello_world/createuser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CreateUser? createUser = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Latihan Consume API Post",
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text((createUser != null)
                  ? createUser!.id.toString() +
                      " | " +
                      createUser!.token +
                      " | "
                  : "Tidak ada data"),
              ElevatedButton(
                onPressed: () {
                  CreateUser.connectToAPI("eve.holt@reqres.in", "pistole").then(
                    (value) {
                      createUser = value;
                      setState(() {});
                    },
                  );
                },
                child: const Text("Create New User"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
