import 'package:electric_scooter_app/screen/profile/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileViewModel>(context, listen: false).getPref();
  }

  @override
  Widget build(BuildContext context) {
    final modelProfile = Provider.of<ProfileViewModel>(context);
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
                      modelProfile.logout();
                      Navigator.pushNamed(context, '/login');
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
                  modelProfile.fullname,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  "Join at " + modelProfile.createdDate,
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
                  modelProfile.email,
                  style: const TextStyle(
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
                  modelProfile.phone,
                  style: const TextStyle(
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
                  modelProfile.address,
                  style: const TextStyle(
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
