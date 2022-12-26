import 'package:dio_mvvm/data/model/myresponse_model.dart';
import 'package:dio_mvvm/data/model/users_model.dart';
import 'package:dio_mvvm/data/repository/app_repository.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel({required AppRepository appRepository}) {
    _appRepository = appRepository;
    fetchAllUsers();
  }

  late AppRepository _appRepository;
  List<UsersModel> user = [];
  String errorForUI = "";

  fetchAllUsers() async {
    MyResponse response = await _appRepository.getAllUsers();
    if (response.error.isEmpty) {
      user = response.data as List<UsersModel>;
    } else {
      errorForUI = response.error;
    }
    notifyListeners();
  }
}