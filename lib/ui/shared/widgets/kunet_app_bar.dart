import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/widgets/app_back_button.dart';

import '../shared_styles.dart';
import '../ui_helpers.dart';

// class hulunfechiAppbar extends StatelessWidget {
//   final String title;
//   final bool hasBackButton;
//   const hulunfechiAppbar({Key? key, this.hasBackButton = true, required this.title})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         if (hasBackButton) AppBackButton(),
//         Text(title, style: ktsAppTitleTextStyle),
//         horizontalSpaceSmall
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class hulunfechiAppbar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String title;
  final Function()? onBackButtonTap;
  final Color backgroundColor;
  const hulunfechiAppbar(
      {Key? key,
      this.actions,
      required this.title,
      this.onBackButtonTap,
      this.backgroundColor = kcVeryLightGrey})
      : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backwardsCompatibility: false,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      leading: onBackButtonTap != null
          ? Padding(
              padding: const EdgeInsets.all(11.0),
              child: AppBackButton(
                onTap: onBackButtonTap,
              ),
            )
          : null,
      title: Text(
        title,
        style: ktsDarkGreyTextStyle.copyWith(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
