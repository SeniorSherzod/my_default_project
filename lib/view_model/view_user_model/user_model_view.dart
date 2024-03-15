import 'package:flutter/cupertino.dart';
import 'package:my_default_project/data/models/user_model/user_model.dart';
import 'package:my_default_project/data/repository/users_repository.dart';

class UsersViewModel extends ChangeNotifier{
  UsersViewModel ({
    required this.usersRepository,
  }){
    fetchUsers();
  }
  final UsersRepository usersRepository;

  bool isLoading = false;
  List<UserModel> users =[];

  fetchUsers()async{
    isLoading=true;
    notifyListeners();
    var person= await usersRepository.getUsers();
    isLoading=false;
    notifyListeners();
    if(person.isEmpty){

    }else{
      users=person;
      notifyListeners();
    }
  }
}
