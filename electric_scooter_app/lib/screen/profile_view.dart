import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/shared_pref_profile_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String fullname = "";
  String createdDate = "";
  String phone = "";
  String email = "";
  String address = "";

  getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      fullname = sharedPreferences.getString(PrefProfile.name).toString();
      createdDate =
          sharedPreferences.getString(PrefProfile.createdAt).toString();
      phone = sharedPreferences.getString(PrefProfile.phone).toString();
      email = sharedPreferences.getString(PrefProfile.email).toString();
      address = sharedPreferences.getString(PrefProfile.address).toString();
    });
  }

  logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(PrefProfile.idUSer);
    sharedPreferences.remove(PrefProfile.name);
    sharedPreferences.remove(PrefProfile.email);
    sharedPreferences.remove(PrefProfile.phone);
    sharedPreferences.remove(PrefProfile.address);
    sharedPreferences.remove(PrefProfile.createdAt);
    Navigator.pushNamed(context, '/login');
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      logout();
                    },
                    icon: const Icon(
                      Icons.logout_outlined,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
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
                leading: const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.amberAccent,
                ),
                title: Text(
                  fullname,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  "Join at " + createdDate,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: const Icon(
                  Icons.email_outlined,
                  color: Colors.amberAccent,
                ),
                title: Text(
                  email,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: const Icon(
                  Icons.call_outlined,
                  color: Colors.amberAccent,
                ),
                title: Text(
                  phone,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.place_outlined,
                  color: Colors.amberAccent,
                ),
                title: Text(
                  address,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
