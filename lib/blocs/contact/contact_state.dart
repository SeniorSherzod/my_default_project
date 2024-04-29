import '../../data/models/contact_model.dart';

abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactListLoaded extends ContactState {
  final List<ContactModel> contacts;

  ContactListLoaded(this.contacts);
}

class ContactSelected extends ContactState {
  final ContactModel contact;

  ContactSelected(this.contact);
}
