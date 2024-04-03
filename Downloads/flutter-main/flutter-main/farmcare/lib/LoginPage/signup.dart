import 'package:farmcare/LoginPage/startpage.dart';
import 'package:flutter/material.dart';
import 'package:farmcare/LoginPage/loginData.dart';
import 'package:farmcare/LoginPage/loginpage.dart';
//import 'package:login/startpage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  Future<List> getUsernames() async {
    final localDB = await logindatabase;
    List<Map<String, dynamic>> mapEntry = await localDB.query("loginTable");

    List usernames = mapEntry.map((entry) => entry['userName']).toList();
    return usernames;
  }

  List usernames = [];
  void someFunction() async {
    usernames = await getUsernames();
    print(usernames);
  }

  @override
  void initState() {
    super.initState();
    someFunction();
  }

  Widget err() {
    return Container();
  }

  Widget input(TextEditingController controller, String hintText,
      IconData iconData, List al) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 15, top: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 33, 243, 86)),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          icon: IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget user(TextEditingController userName, List usernames) {
    print(usernames);
    print(userName.text);
    if (usernames.contains(userName.text)) {
      print('in if');
      return Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 15, top: 20),
        child: TextField(
          controller: userName,
          decoration: InputDecoration(
            hintText: 'userName',
            errorText: 'username allready present',
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 33, 243, 86)),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else {
      print('in else');
      return Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 15, top: 20),
        child: TextField(
          controller: userName,
          decoration: InputDecoration(
            hintText: 'userName',
            //errorText: 'allready present',
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 33, 243, 86)),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 169, 197, 220),
              Color.fromARGB(255, 167, 194, 216),
              Color.fromARGB(255, 103, 144, 177),
              Color.fromARGB(255, 74, 146, 206),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                'REGISTER',
                style: TextStyle(
                    color: Color.fromARGB(255, 250, 251, 252),
                    fontSize: 33,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Text(
              'create your account',
              style: TextStyle(
                  color: Color.fromARGB(255, 250, 251, 252),
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            input(name, 'Name', Icons.person, usernames),

            // input(userName, 'username', Icons.person, usernames),
            user(userName, usernames),

            input(email, 'email', Icons.email, usernames),

            //password
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 15, top: 20),
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  hintText: 'Password',
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
                      Icons.remove_red_eye,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            //Register Button
            Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 100, right: 100),
              child: ElevatedButton(
                onPressed: () async {
                  LoginDataBase obj = LoginDataBase(
                    email: email.text,
                    name: name.text,
                    password: password.text,
                    userName: userName.text,
                  );
                  setState(() {});
                  if (usernames.contains(userName.text)) {
                    const AlertDialog(
                      content: Text('This userName allready present'),
                    );

                    print('name alerady present');
                  } else {
                    await insertData(obj);
                    print(await getUsernames());

                    setState(() {
                      userName.clear();
                      name.clear();
                      password.clear();
                      email.clear();
                    });
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  }
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                child: const Center(
                  child: Text(
                    'Register',
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
    );
  }
}
