import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/app_colors.dart';
import 'package:hulunfechi/ui/shared/shared_styles.dart';
import 'package:hulunfechi/ui/shared/ui_helpers.dart';
import 'package:hulunfechi/ui/shared/widgets/action_item.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/app_divider.dart';
import 'package:stacked_services/stacked_services.dart';

class PostOpetions extends StatelessWidget {
  const PostOpetions({this.completer, required this.request, Key? key})
      : super(key: key);
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: kcAppBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: _Header(
        completer: completer,
        request: request,
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.request,
    this.completer,
    Key? key,
  }) : super(key: key);

  final SheetRequest request;
  final Function(SheetResponse)? completer;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SafeArea(
        child: Padding(
          padding: appSymmetricEdgePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    height: 4,
                    width: 40,
                    color: kcDarkGreyColor,
                  ),
                ),
              ),
              verticalSpaceMedium,
              ActionsItem(
                title: 'Edit post',
                iconData: Icons.edit,
                hasTrailingIcon: true,
                onTap: () => completer?.call(SheetResponse(data: 0)),
              ),
              verticalSpaceSmall,
              AppDivider(),
              ActionsItem(
                title: 'Delete post',
                iconData: Icons.delete_forever,
                hasTrailingIcon: false,
                iconColor: Colors.red,
                onTap: () => completer?.call(SheetResponse(data: 1)),
              ),
            ],
          ),
        ),
      ),
      // if (model.isBusy)
      //   Material(
      //     color: kcDarkBlueBlack.withOpacity(0.7),
      //     child: Align(
      //       alignment: Alignment.center,
      //       child: CircularProgressIndicator(
      //         color: kcPrimaryColor,
      //       ),
      //     ),
      //   )
    ]);
  }
}
