import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hint;
  final String? errorText;
  final String? infoText;
  final bool infoAction;
  final bool isObscure;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final FocusNode? focusNode;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: padding,
        child: TextField(
          controller: textController,
          focusNode: focusNode,
          onChanged: onChanged,
          autofocus: autoFocus,
          textInputAction: inputAction,
          textDirection: TextDirection.rtl,
          obscureText: this.isObscure,
          maxLength: 25,
          keyboardType: this.inputType,
          style: Theme
              .of(context)
              .textTheme
              .body1,
          decoration: InputDecoration(
            hintText: this.hint,
            hintStyle:
            Theme
                .of(context)
                .textTheme
                .body1!
                .copyWith(color: hintColor),
            errorText: errorText,
            counter: Row(
              children: [
                Text(
                  "$infoText",
                  style: TextStyle(
                    decoration: infoAction?TextDecoration.underline:TextDecoration.none,
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }

  const TextFieldWidget({
    Key? key,
    required this.errorText,
    required this.textController,
    required this.infoText,
    required this.infoAction,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.focusNode,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
  }) : super(key: key);
}
