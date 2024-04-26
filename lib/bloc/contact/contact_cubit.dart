import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/contact_model.dart';
import '../../data/network/contact_list.dart';
import 'contact_state.dart';

class ContactBloc extends Cubit<ContactState> {
  ContactBloc() : super(ContactInitial());

  final List<ContactModel> _contacts = allContacts; // Use the provided data

  ContactModel? selectedContact;

  void openConversation(ContactModel contact) {
    selectedContact = contact;
    emit(ContactSelected(contact));
  }

  void fetchContacts() {
    emit(ContactListLoaded(_contacts)); // Emit state with existing contacts
  }
}
