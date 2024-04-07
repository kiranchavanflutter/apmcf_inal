import 'package:farmcare/Home/HomePage.dart';
import 'package:farmcare/LoginPage/startpage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() => _LoginState();
}

class _LoginState extends State {
  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 1, 58, 105),
              Color.fromARGB(255, 7, 82, 143),
              Color.fromARGB(255, 36, 120, 189),
              Color.fromARGB(255, 80, 158, 221),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'FarmCare',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
              ),
              //userName
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 15, top: 20),
                child: TextField(
                  controller: userName,
                  decoration: InputDecoration(
                    hintText: 'userName',
                    border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 33, 243, 86)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    icon: IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              //Password
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 15, top: 20),
                child: TextField(
                  obscureText: true,
                  controller: passWord,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.black),
                    border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 33, 243, 86)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    icon: IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: const Icon(Icons.remove_red_eye),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              //Login
              Padding(
                padding:
                    const EdgeInsets.only(top: 70.0, left: 100, right: 100),
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {});
                    if (!un.contains(userName.text)) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Message'),
                            content: const Text('UserName Not Found'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      int index = un.indexOf(userName.text);
                      if (pass[index] != passWord.text) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Message'),
                              content: const Text('Wrong PassWord'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
