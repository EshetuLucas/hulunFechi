import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String? validationMessage;
  final Function? enterPressed;
  final bool smallVersion;
  final FocusNode? fieldFocusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;
  final String? additionalNote;
  final Function(String)? onChanged;
  final TextInputFormatter? formatter;
  final double fieldHeight;
  final int? maxTextLimit;
  final bool hasFocusedBorder;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlignVertical textAlignVertical;
  final bool autoFoucus;
  final bool expands;
  final Color? iconColor;
  final int? maxLine;
  final bool hasBoxDecoration;
  final bool hasInputDecoration;
  final BoxDecoration? boxDecoration;
  final bool obscureText;
  final String? floatingPlaceholder;
  InputField({
    required this.controller,
    required this.placeholder,
    this.enterPressed,
    this.expands = false,
    this.fieldFocusNode,
    this.hasFocusedBorder = false,
    this.nextFocusNode,
    this.additionalNote,
    this.onChanged,
    this.obscureText = false,
    this.formatter,
    this.autoFoucus = false,
    this.hasInputDecoration = true,
    this.validationMessage,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.password = false,
    this.isReadOnly = false,
    this.smallVersion = false,
    this.fieldHeight = 60.0,
    this.maxTextLimit,
    this.prefixIcon,
    this.suffixIcon,
    this.iconColor,
    this.maxLine,
    this.boxDecoration,
    this.hasBoxDecoration = true,
    this.textAlignVertical = TextAlignVertical.center,
    this.floatingPlaceholder,
  });

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (floatingPlaceholder != null)
          Text(
            floatingPlaceholder!,
          ),
        if (floatingPlaceholder != null) verticalSpaceTiny,
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: isReadOnly ? 0.3 : 1.0,
          child: Container(
            // height: smallVersion ? 40 : fieldHeight,
            alignment: Alignment.centerLeft,
            decoration: boxDecoration ?? null,
            child: TextFormField(
              style: ktsDarkGreyTextStyle,
              textCapitalization: textInputType != TextInputType.emailAddress
                  ? TextCapitalization.sentences
                  : TextCapitalization.none,
              textAlignVertical: textAlignVertical,
              expands: expands,
              maxLines: maxLine,
              maxLength: maxTextLimit,
              autofocus: autoFoucus,
              autocorrect: true,
              controller: controller,
              keyboardType: textInputType,
              focusNode: fieldFocusNode,
              textInputAction: textInputAction,
              onChanged: onChanged,
              obscureText: obscureText,
              onEditingComplete: () {
                if (enterPressed != null) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  enterPressed!();
                }
                if (nextFocusNode != null)
                  nextFocusNode!.nextFocus();
                else
                  FocusScope.of(context).unfocus();
              },
              onFieldSubmitted: (value) {
                if (nextFocusNode != null) {
                  nextFocusNode!.requestFocus();
                }
              },
              readOnly: isReadOnly,
              decoration: InputDecoration(
                enabledBorder: hasInputDecoration
                    ? OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kcItemsBackground, width: 1.2),
                        borderRadius: BorderRadius.circular(8.0),
                      )
                    : null,
                focusedBorder: OutlineInputBorder(
                  borderSide: hasFocusedBorder
                      ? BorderSide(
                          color: hasFocusedBorder && !isReadOnly
                              ? kcPrimaryColor
                              : kcItemsBackground,
                          width: 1.2)
                      : BorderSide(color: Colors.transparent, width: 1.2),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: prefixIcon ?? null,
                suffixIcon: suffixIcon ?? null,
                border: InputBorder.none,
                hintText: placeholder,
                labelStyle: ktsSmallDarkTextStyle,
                hintStyle: ktsDarkGreyTextStyle.copyWith(
                    color: kcDarkGreyColor.withOpacity(0.5)),
                contentPadding: EdgeInsets.only(
                  left: 18,
                  top: 14,
                  bottom: 12,
                  right: 10,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
