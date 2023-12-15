import 'package:auth_page/extentions/extentios_to_string.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username;
  String? email;
  String? password;

  @override
  void initState() {
    fetchDataFromSf();
    super.initState();
  }

  fetchDataFromSf() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      username = sf.getString('username');
      email = sf.getString('email');
      password = sf.getString('password');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF),
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              child: Image.asset('assets/flutter.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                height: 0.5,
              ),
            ),
            Text(
              'Username: ${username ?? 'empty'}',
              style: TextStyle().style(),
            ),
            Text(
              'email: ${email ?? 'empty'}',
              style: TextStyle().style(),
            ),
            Text(
              'password: ${password ?? 'empty'}',
              style: TextStyle().style(),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
                color: Colors.green,
                child: Text('Follow on Medium', style: TextStyle().style()),
                onPressed: () async {
                  final Uri url = Uri.parse('https://flutter.dev');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                })
          ],
        ),
      ),
    );
  }
}
