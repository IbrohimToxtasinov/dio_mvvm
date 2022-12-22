import 'package:dio_mvvm/data/model/fields_model.dart';
import 'package:dio_mvvm/data/model/myresponse_model.dart';
import 'package:dio_mvvm/data/repository/app_repository.dart';
import 'package:flutter/foundation.dart';

class FieldsViewModel extends ChangeNotifier {
  FieldsViewModel({required AppRepository appRepository}) {
    _appRepository = appRepository;
  }

  late AppRepository _appRepository;

  String errorForUI = "";

  bool isLoading = false;

  List<FieldsModel>? incomeTypes;

  fetchAllFields() async {
    MyResponse myResponse = await _appRepository.getAllFields();

    if (myResponse.error.isEmpty) {
      incomeTypes = myResponse.data as List<FieldsModel>;
    } else {
      errorForUI = myResponse.error;
    }
    notifyListeners();
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
