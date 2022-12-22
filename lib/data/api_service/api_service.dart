import 'package:dio/dio.dart';
import 'package:dio_mvvm/data/api_service/api_client.dart';
import 'package:dio_mvvm/data/model/fields_model.dart';
import 'package:dio_mvvm/data/model/myresponse_model.dart';

class ApiService extends ApiClient {
  MyResponse myResponse = MyResponse(error: "");

  Future<MyResponse> getAllFields() async {
    try {
      Response response = await dio.get("${dio.options.baseUrl}/dynamic");
      if (response.statusCode == 200) {
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
}
