import 'package:dio_mvvm/data/api_service/api_service.dart';
import 'package:dio_mvvm/data/repository/app_repository.dart';
import 'package:dio_mvvm/screens/users_page.dart';
import 'package:dio_mvvm/view_model/fields_view_model.dart';
import 'package:dio_mvvm/view_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => FieldsViewModel(
          appRepository: AppRepository(
            apiService: ApiService(),
          ),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => UserViewModel(
          appRepository: AppRepository(
            apiService: ApiService(),
          ),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleUsageIncomes(),
    );
  }
}
