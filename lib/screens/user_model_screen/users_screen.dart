import 'package:flutter/material.dart';
import 'package:my_default_project/data/models/user_model/user_model.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/view_model/view_user_model/user_model_view.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: context.watch<UsersViewModel>().isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: () {
          return Future<void>.delayed(
            const Duration(seconds: 2),
                () {
              context.read<UsersViewModel>().fetchUsers();
            },
          );
        },
        child: GridView.builder(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.0, // Spacing between columns
            mainAxisSpacing: 10.0, // Spacing between rows
          ),
          itemCount: context.watch<UsersViewModel>().users.length,
          itemBuilder: (BuildContext context, int index) {
            UserModel user = context.watch<UsersViewModel>().users[index];
            return Card(
              color: AppColors.white,
              elevation: 2.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Provide a fixed size for the image
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Image.network(
                      user.avatarUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    leading:Text(user.name),
                    subtitle:  Text(user.id.toString()),
                    trailing:  Text(user.username),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
