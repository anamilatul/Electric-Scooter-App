import 'package:electric_scooter_app/screen/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/shared_pref_profile_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late String _userID;
  String get userID => _userID;

  getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _userID = sharedPreferences.getString(PrefProfile.idUSer) ?? '';
      _userID == null ? isLogout() : isLogin();
    });
  }

  isLogin() {
    Navigator.pushNamed(context, '/home');
  }

  isLogout() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_skuter.png',
              color: Colors.amber,
              height: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: const Text(
                "\t\tWelcome to our electric scooter store! \nFind the perfect scooter for your needs. \nStart riding and join the electric revolution!",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 61, 57, 57),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
