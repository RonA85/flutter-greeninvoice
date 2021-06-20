import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/user/user.dart';
import 'package:boilerplate/ui/welcome/welcome.dart';
import 'package:boilerplate/utils/helper.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/utils/styles/Colors.dart';
import 'package:boilerplate/utils/styles/TextStyles.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:boilerplate/widgets/social_rounded_button_widget.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:boilerplate/utils/extenstions/WidgetExtensions.dart';

import '../../stores/user/user_store.dart';

final store = getIt<UserStore>();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  // late ThemeStore _themeStore;

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;


  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: SvgPicture.asset(
          "assets/images/green_logo.svg",
          color: primary,
        ),
        actions: [Icon(Icons.menu).paddingWidget(right: 16)],
      ),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Spacer(),
          Text(
            "היי, טוב לראות אותך",
            textAlign: TextAlign.center,
            style: almoni40,
          ),
          _buildUserIdField().paddingWidget(bottom: 20, top: 40),
          _buildPasswordField(),
          Spacer(
            flex: 1,
          ),
          _buildSignInButton().paddingWidget(bottom: 20),
          _buildGoogleButton(),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        return Column(
          children: [
            TextFieldWidget(
              //hint: AppLocalizations.of(context).translate('login_et_user_email'),
              hint: 'מייל',
              inputType: TextInputType.emailAddress,
              textController: _userEmailController,
              inputAction: TextInputAction.next,
              autoFocus: false,
              //errorText: _store.formErrorStore.userEmail,
              errorText: null,
              infoText: "כתובת המייל איתה נרשמת לחשבונית ירוקה",
              infoAction: false,
            ),
          ],
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'סיסמה',
          // hint:
          //     AppLocalizations.of(context).translate('login_et_user_password'),
          isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          // errorText: _store.formErrorStore.password,
          errorText: null,
          infoAction: true,
          infoText: "שכחת סיסמה?",
        );
      },
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: FractionalOffset.centerRight,
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        child: Text(
          AppLocalizations.of(context).translate('login_btn_forgot_password'),
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: Colors.orangeAccent),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildSignInButton() {
    return RoundedButtonWidget(
      buttonText: 'כניסה',
      buttonColor: primary,
      textColor: Colors.white,
      onPressed: () async {
        if (_userEmailController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty) {
          DeviceUtils.hideKeyboard(context);
          final user = await store.login(
              _userEmailController.text, _passwordController.text);
          if (user.email != null) {
            pushAndRemoveUntil(context, WelcomeScreen(user: user,), false);
          }
        } else {
          _showErrorMessage('Please fill in all fields');
        }
      },
    );
  }

  Widget _buildGoogleButton() {
    return SocialRoundedButtonWidget(
      logo: "google_icon",
      buttonText: 'כניסה מהירה',
      buttonColor: Colors.orangeAccent,
      textColor: Colors.white,
      onPressed: () async {
      },
    );
  }


  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context).translate('home_tv_error'),
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
