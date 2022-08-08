import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> username = [];
  List<String> password = [];
  bool login = false;
  TextEditingController controller = TextEditingController();
  TextEditingController loginUserNameController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController signUpUserNameController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  int _counter = 0;
  List<String> messages = [];
  List<String> sender = [];

  void _incrementCounter() {
    setState(() {
      if (login) {
        // a pop up widow
        AlertDialog(
          title: const Text("Enter message"),
          content: TextField(controller: controller),
        );
        _counter++;
      } else {
        AlertDialog(
          title: TabBar(tabs: [
            Tab(
              text: "Login",
              child: Center(
                  child: Column(
                children: [
                  TextField(
                    controller: loginUserNameController,
                  ),
                  TextField(
                    controller: loginPasswordController,
                  ),
                  ElevatedButton(
                    onPressed: () => loginFunction(),
                    child: const Text("login"),
                  )
                ],
              )),
            ),
            Tab(
              text: "Sign Up",
              child: Center(
                  child: Column(
                children: [
                  TextField(
                    controller: signUpUserNameController,
                  ),
                  TextField(
                    controller: signUpPasswordController,
                  ),
                  ElevatedButton(
                    onPressed: () => signUpFunction(),
                    child: const Text("Sign Up"),
                  )
                ],
              )),
            )
          ]),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _counter,
        itemBuilder: (context, index) => ListTile(
          title: Text(sender[index]),
          subtitle: Text(messages[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  loginFunction() {
    if (username.any((element) => loginPasswordController.text == element) &&
        password.any((element) => loginPasswordController.text == element)) {
      login = true;
    }
  }

  signUpFunction() {
    username.add(signUpUserNameController.text);
    password.add(signUpPasswordController.text);
    login = true;
  }
}
