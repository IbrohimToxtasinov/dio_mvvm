import 'package:dio_mvvm/data/api_service/api_service.dart';
import 'package:dio_mvvm/data/model/myresponse_model.dart';

class AppRepository {
  AppRepository({required this.apiService});
  ApiService apiService;
  Future<MyResponse> getAllFields() => apiService.getAllFields();
}
