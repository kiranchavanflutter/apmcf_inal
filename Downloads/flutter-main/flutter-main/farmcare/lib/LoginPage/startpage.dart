import 'package:farmcare/LoginPage/loginData.dart';
import 'package:flutter/material.dart';
import 'package:farmcare/LoginPage/signup.dart';
import 'package:farmcare/LoginPage/loginpage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State createState() => _LoginState();
}

List al = [
  {'userName': '', 'password': ''}
];
List un = [];
List pass = [];

class _LoginState extends State<Login> {
  fetchlogData() async {
    List data = await getData();
    print(data);
    for (int i = 0; i < data.length; i++) {
      String usn = data[i].userName;
      String pas = data[i].password;
      un.add(usn);
      pass.add(pas);
      al.add(data[i]);
    }
    print(al);
    print(un);
    print(pass);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 2, 81, 146),
              Color.fromARGB(255, 41, 118, 182),
              Color.fromARGB(255, 86, 170, 240),
            ],
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 2, 81, 146),
                    Color.fromARGB(255, 41, 118, 182),
                    Color.fromARGB(255, 86, 170, 240),
                  ],
                ),
              ),
              //child: Image.network('assets/fcare'),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 4.0, top: 50),
              child: Text(
                'FarmCare',
                style: TextStyle(
                    color: Color.fromARGB(255, 250, 251, 252),
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Text(
              '''can't seem to keep a plant alive?
    let us help you change that''',
              style: TextStyle(
                  color: Color.fromARGB(255, 250, 251, 252),
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 100, left: 100),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ),
                  );
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                child: const Center(
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 100, left: 100),
              child: ElevatedButton(
                onPressed: () async {
                  await fetchlogData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
