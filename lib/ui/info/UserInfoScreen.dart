import 'package:boilerplate/models/user/user.dart';
import 'package:boilerplate/ui/info/components/BusinessCardWidget.dart';
import 'package:boilerplate/ui/info/components/LineInfoWidget.dart';
import 'package:boilerplate/utils/styles/Colors.dart';
import 'package:boilerplate/utils/styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:boilerplate/utils/extenstions/WidgetExtensions.dart';

class UserInfoScreen extends StatelessWidget {
  final User? user;

  const UserInfoScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildMainContent(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: primary),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: SvgPicture.asset(
        "assets/images/green_logo.svg",
        color: primary,
      ),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildPersonalDetails().paddingWidget(bottom: 24,top: 8),
            _buildBusinessesDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalDetails() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "פרטיים אישיים",
            style: almoni20,
          ),
          Divider(),
          LineInfoWidget(
            title: "שם מלא",
            info: user?.fullName(),
          ),
          LineInfoWidget(title: "מספר טלפון", info: user?.phone),
          LineInfoWidget(title: "אימייל", info: user?.email),
          LineInfoWidget(title: "ת.ז", info: user?.idNumber),
          LineInfoWidget(title: "נרשם ב", info: user?.idNumber),
        ],
      );

  Widget _buildBusinessesDetails() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "העסקים שלך",
            style: almoni20,
          ),
          Divider(),
          for (var business in user?.businessList?.business ?? [])
            BusinessCardWidget(
              business: business,
            ),
        ],
      );
}
