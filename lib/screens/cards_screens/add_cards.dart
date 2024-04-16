import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/bloc/card_bloc.dart';
import 'package:my_default_project/bloc/card_event.dart';
import 'package:my_default_project/data/models/card_model.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  late TextEditingController ownerNameController;
  late TextEditingController cardNameController;
  late TextEditingController cardNumberController;
  late TextEditingController bankNameController;
  late TextEditingController expireDateController;
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();
    ownerNameController = TextEditingController();
    cardNameController = TextEditingController();
    cardNumberController = TextEditingController();
    bankNameController = TextEditingController();
    expireDateController = TextEditingController();
    amountController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Card"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: ownerNameController,
              decoration: const InputDecoration(labelText: "Owner Name"),
            ),
            TextFormField(
              controller: cardNameController,
              decoration: const InputDecoration(labelText: "Card Name"),
            ),
            TextFormField(
              controller: cardNumberController,
              decoration: const InputDecoration(labelText: "Card Number"),
            ),
            TextFormField(
              controller: bankNameController,
              decoration: const InputDecoration(labelText: "Bank Name"),
            ),
            TextFormField(
              controller: expireDateController,
              decoration: const InputDecoration(labelText: "Expire Date"),
            ),
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _addCard();
              },
              child: const Text("Add Card"),
            ),
          ],
        ),
      ),
    );
  }

  void _addCard() {
    // Get the values from the text controllers
    String ownerName = ownerNameController.text;
    String cardName = cardNameController.text;
    String cardNumber = cardNumberController.text;
    String bankName = bankNameController.text;
    String expireDate = expireDateController.text;
    double amount = double.tryParse(amountController.text) ?? 0.0;

    // Create a CardModel instance
    CardModel newCard = CardModel(
      ownerName: ownerName,
      cardName: cardName,
      cardNumber: cardNumber,
      bankName: bankName,
      expireDate: expireDate,
      amount: amount, color: "0xFFF7A593", isMain: false, uuid: '', providerName: '',
    );

    context.read<CardsBloc>().add(AddCardEvent(newCard));

    // Navigate back to the previous screen
    Navigator.pop(context);
  }
}
