import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hulunfechi/app/app.locator.dart';
import 'package:hulunfechi/enums/dialog_type.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_button.dart';

import 'package:stacked_services/stacked_services.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.ERROR: (context, sheetRequest, completer) =>
        ErrorDialog(request: sheetRequest, completer: completer),
    DialogType.SUCCESS: (context, sheetRequest, completer) =>
        SuccessDialog(request: sheetRequest, completer: completer),
    DialogType.LANGUAGE: (context, sheetRequest, completer) =>
        LanguageDialog(request: sheetRequest, completer: completer),
    DialogType.DELETE: (context, sheetRequest, completer) =>
        DeletePostConfirmationDialog(
            request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class ErrorDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const ErrorDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: kcWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 25,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              request.title ?? '',
              style: ktsDarkGreyTextStyle,
              textAlign: TextAlign.center,
            ),
            verticalSpaceSmall,
            Text(
              request.description ?? '',
              textAlign: TextAlign.center,
            ),
            Align(
              alignment: Alignment.center,
              child: MaterialButton(
                onPressed: () => completer(DialogResponse()),
                child: Text(request.mainButtonTitle ?? 'Okay',
                    style: ktsGreenBoldTextStyle),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const SuccessDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: kcWhite,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpaceMedium,
            Icon(
              request.mainButtonTitle == 'Setup'
                  ? Icons.account_balance
                  : Icons.check_circle,
              size: 80.0,
              color: kcPrimaryColor,
            ),
            if (request.title != null) verticalSpaceSmall,
            Text(
              request.title ?? 'Success',
              style: ktsGreenBoldTextStyle,
              textAlign: TextAlign.center,
            ),
            verticalSpaceMedium,
            Text(
              request.description ?? 'Your content is posted successfully. ',
              style: ktsDarkGreyTextStyle,
              textAlign: TextAlign.center,
            ),
            verticalSpaceMedium,
            AppButton(
              title: request.mainButtonTitle ?? 'Back',
              height: 48.0,
              onTap: () => completer(DialogResponse()),
            ),
          ],
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  final void Function()? onTap;
  const _CloseButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kcDarkGreyColor,
            border: Border.all(
              width: 2,
              color: Colors.red.withOpacity(0.3),
            )),
        height: 50,
        width: 50,
        alignment: Alignment.center,
        child: Icon(
          Icons.close,
          color: kcDarkGreyColor,
        ),
      ),
    );
  }
}

class LanguageDialog extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const LanguageDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  String _currentLang = 'en';
  void _languageChanged(String? value) {
    setState(() {
      _currentLang = value ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: kcWhite,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Language',
                style:
                    ktsGreenBoldTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              verticalSpaceMedium,
              ListBody(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'English',
                      style: ktsDarkGreyTextStyle,
                    ),
                    trailing: new Radio(
                      activeColor: kcPrimaryColor,
                      onChanged: _languageChanged,
                      value: 'en',
                      groupValue: _currentLang,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'عربى',
                      style: ktsDarkGreyTextStyle,
                    ),
                    trailing: new Radio(
                      activeColor: kcPrimaryColor,
                      onChanged: _languageChanged,
                      value: 'ar',
                      groupValue: _currentLang,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'አማርኛ',
                      style: ktsDarkGreyTextStyle,
                    ),
                    trailing: new Radio(
                      activeColor: kcPrimaryColor,
                      onChanged: _languageChanged,
                      value: 'am',
                      groupValue: _currentLang,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Afaan Oromoo',
                      style: ktsDarkGreyTextStyle,
                    ),
                    trailing: new Radio(
                      activeColor: kcPrimaryColor,
                      onChanged: _languageChanged,
                      value: 'or',
                      groupValue: _currentLang,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'ትግርኛ',
                      style: ktsDarkGreyTextStyle,
                    ),
                    trailing: new Radio(
                      activeColor: kcPrimaryColor,
                      onChanged: _languageChanged,
                      value: 'tr',
                      groupValue: _currentLang,
                    ),
                  )
                ],
              ),
              verticalSpaceMedium,
              AppButton(
                title: 'Done',
                height: 48.0,
                onTap: () => widget.completer(DialogResponse()),
              ),
              verticalSpaceMedium,
            ],
          )),
    );
  }
}

class DeletePostConfirmationDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const DeletePostConfirmationDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpaceMedium,
              if (request.title != null) verticalSpaceSmall,
              Text(
                request.title ?? '',
                style: ktsDarkGreyBoldTextStyle.copyWith(
                  color: kcPrimaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpaceMedium,
              Text(
                request.description ?? '',
                style: ktsDarkGreyTextStyle,
                textAlign: TextAlign.center,
              ),
              verticalSpaceMedium,
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: AppButton(
                        title: 'Cancel',
                        height: 45.0,
                        onTap: () =>
                            completer.call((DialogResponse(confirmed: false))),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () =>
                            completer.call((DialogResponse(confirmed: true))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            request.additionalButtonTitle ?? 'Yes',
                            style: ktsGreenBoldTextStyle,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
