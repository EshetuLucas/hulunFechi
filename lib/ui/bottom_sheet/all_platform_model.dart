import 'package:hulunfechi/app/app.logger.dart';
import 'package:stacked/stacked.dart';

class AllPlatformBottomSheetModel extends BaseViewModel {
  final log = getLogger('AllPlatformBottomSheetModel');
  List<int> _selectedValue = [];
  List<int> get selectedValue => _selectedValue;

  void onSelected(int index) {
    log.i('index:$index');
    if (_selectedValue.contains(index)) {
      _selectedValue.remove(index);
    } else {
      _selectedValue.add(index);
    }

    notifyListeners();
  }
}
