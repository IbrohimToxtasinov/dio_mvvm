import 'package:dio_mvvm/view_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SampleUsageIncomes extends StatefulWidget {
  const SampleUsageIncomes({Key? key}) : super(key: key);

  @override
  State<SampleUsageIncomes> createState() => _SampleUsageIncomesState();
}

class _SampleUsageIncomesState extends State<SampleUsageIncomes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Incomes Types"),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorForUI.isNotEmpty) {
            return Center(
              child: Text(viewModel.errorForUI),
            );
          }
          return viewModel.user.isNotEmpty
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: viewModel.user.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${viewModel.user[index].id}"),
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        "Incomes type: ${viewModel.user[index].title}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : Center(
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<UserViewModel>().fetchAllUsers();
                      },
                      child: const Text("Get Data")),
                );
        },
      ),
    );
  }
}
