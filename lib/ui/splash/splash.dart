import 'dart:async';

import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/stores/user/user_store.dart';
import 'package:boilerplate/ui/welcome/welcome.dart';
import 'package:boilerplate/utils/helper.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

final store = getIt<UserStore>();

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: SvgPicture.asset("assets/images/green_logo")),
    );
  }
  navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool(Preferences.is_logged_in) ?? false) {
      final email = preferences.getString(Preferences.email);
      final password = preferences.getString(Preferences.pass);
      store.login(email!, password!).then((value) => push(
          context,
          WelcomeScreen(
            user: value,
          )));
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    }
  }
}
