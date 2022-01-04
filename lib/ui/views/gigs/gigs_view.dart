import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:stacked/stacked.dart';
import 'gigs_viewmodel.dart';

class GigsView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GigsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(body: Container()),
      viewModelBuilder: () => GigsViewModel(),
    );
  }
}
