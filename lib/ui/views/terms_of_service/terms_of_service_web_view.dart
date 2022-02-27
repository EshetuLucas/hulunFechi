import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hulunfechi/ui/shared/widgets/kunet_app_bar.dart';
import 'package:hulunfechi/ui/widgets/dumb_widgets/web_viewer.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'terms_of_service_web_viewmodel.dart';

class TermsOfServiceWebView extends StatelessWidget {
  final String url;
  final String title;
  const TermsOfServiceWebView(
      {required this.title, required this.url, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TermsOfServiceWebViewModel>.reactive(
      onModelReady: (model) {
        model.onPageLoadingStart('');
        if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
      },
      builder: (context, model, child) => Scaffold(
        appBar: hulunfechiAppbar(
          title: title,
          onBackButtonTap: model.onBack,
        ),
        body: WebViewer(
          title: "Terms Of Service",
          initialUrl: model.url,
          isBusy: false,
          isWebViewLoading: model.isBusy,
          onPageStarted: model.onPageLoadingStart,
          onPageFinished: model.onPageLoadingFinish,
        ),
      ),
      viewModelBuilder: () => TermsOfServiceWebViewModel(url),
    );
  }
}
