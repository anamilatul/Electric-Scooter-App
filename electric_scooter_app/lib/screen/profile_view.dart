import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late SharedPreferences prefs;
  String fullname = '';
  String email = '';
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      fullname = prefs.getString('fullname').toString();
      email = prefs.getString('email').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 244, 232),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Icon(
                    Icons.manage_accounts,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ListTile(
                leading: const Icon(Icons.account_circle_outlined),
                title: const Text(
                  'Fullname ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  fullname,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: const Icon(Icons.email_outlined),
                title: const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  email,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  prefs.setBool('login', true);
                  prefs.remove('fullname');
                  prefs.remove('email');
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
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
