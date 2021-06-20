import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/models/business/business.dart';
import 'package:boilerplate/models/user/user.dart';
import 'package:boilerplate/ui/info/UserInfoScreen.dart';
import 'package:boilerplate/utils/helper.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/utils/styles/Colors.dart';
import 'package:boilerplate/utils/styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:boilerplate/utils/extenstions/WidgetExtensions.dart';

class WelcomeScreen extends StatefulWidget {
  final User? user;

  const WelcomeScreen({Key? key, this.user}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //stores:---------------------------------------------------------------------
  //late PostStore _postStore;
  //late UserStore _userStore;
  List<Business>? business;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    business = widget.user?.businessList?.business;
  }

  void _showDetails() {
    push(context, UserInfoScreen(user: widget.user,));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildMainContent(),
    );
  }

  // app bar methods:-----------------------------------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: SvgPicture.asset(
        "assets/images/green_logo.svg",
        color: primary,
      ),
      actions: [
        Icon(
          Icons.info_outline,
          color: primary,
        ).paddingWidget(right: 16).onClickWidget(() => _showDetails())
      ],
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "היי ${widget.user?.fullName()},",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: almoni30,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ":ברוף הבא אל",
                textAlign: TextAlign.center,
                style: almoni20,
              ),
            ],
          ),
          _buildBusinessList(),
          Spacer(),
          _buildLogoutButton().paddingWidget(bottom: 30)
        ],
      ),
    );
  }

  Widget _buildBusinessList()=>ListView.builder(
    itemCount: business?.length,
    itemBuilder: (context, i){
      final b = business?[i];
      return Text('${b?.name}',style: TextStyle(fontSize: 30)).centerWidget();
    },
  ).expandedWidget();

  Widget _buildLogoutButton() {
    return IconButton(
      onPressed: () {
        SharedPreferences.getInstance().then((preference) {
          preference.setBool(Preferences.is_logged_in, false);
          Navigator.of(context).pushReplacementNamed(Routes.login);
        });
      },
      icon: Icon(
        Icons.logout,
      ),
    );
  }
}
