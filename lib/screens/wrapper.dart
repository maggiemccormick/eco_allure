import 'package:eco_allure/models/ecoallure_user.dart';
import 'package:eco_allure/screens/authenticate/authenticate.dart';
import 'package:eco_allure/screens/authenticate/login_page.dart';
import 'package:eco_allure/screens/home/home_eco_allure.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<EcoAllureUser?>(context);
    //return LoginPage();
    // return either Home or Authenticate widget
    if (user == null){
      return LoginPage();
    }
    else{
      return EcoAllureHomeScreen();
    }
  }
}
