import 'package:dio/dio.dart';
import 'package:dio_mvvm/data/api_service/api_client.dart';
import 'package:dio_mvvm/data/model/fields_model.dart';
import 'package:dio_mvvm/data/model/myresponse_model.dart';
import 'package:dio_mvvm/data/model/users_model.dart';

class ApiService extends ApiClient {
  MyResponse myResponse = MyResponse(error: "");

  Future<MyResponse> getAllFields() async {
    try {
      Response response = await dio.get("https://dynamic-view-api.free.mockoapp.net/dynamic");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = ((response.data)["fields"] as List?)
                ?.map((e) => FieldsModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getAllUsers() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("https://jsonplaceholder.typicode.com/posts");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data =
            (response.data as List).map((e) => UsersModel.fromJson(e)).toList();
      }
    } catch (error) {
      myResponse = MyResponse(
        error: error.toString(),
      );
    }
    return myResponse;
  }
}



