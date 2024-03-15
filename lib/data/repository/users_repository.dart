import 'package:my_default_project/data/models/user_model/user_model.dart';
import '../network/network_model.dart';

class UsersRepository{
  final NetworkModel networkModel;
  UsersRepository({required this.networkModel});
Future<List<UserModel>> getUsers() async => networkModel.getUsers();
}