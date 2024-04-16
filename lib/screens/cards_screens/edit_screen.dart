import 'package:flutter/material.dart';
import '../../bloc/card_bloc.dart';
import '../../bloc/card_event.dart';
import '../../data/models/card_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCardScreen extends StatefulWidget {
  final CardModel cardModel;

  const EditCardScreen({Key? key, required this.cardModel}) : super(key: key);

  @override
  _EditCardScreenState createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> {
  late TextEditingController _ownerNameController;
  late TextEditingController _cardNumberController;
  late TextEditingController _expireDateController;
  late TextEditingController _bankNameController;
  late TextEditingController _cardNameController;
  late TextEditingController _providerNameController;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _ownerNameController = TextEditingController(text: widget.cardModel.ownerName);
    _cardNumberController = TextEditingController(text: widget.cardModel.cardNumber);
    _expireDateController = TextEditingController(text: widget.cardModel.expireDate);
    _bankNameController = TextEditingController(text: widget.cardModel.bankName);
    _cardNameController = TextEditingController(text: widget.cardModel.cardName);
    _providerNameController = TextEditingController(text: widget.cardModel.providerName);
    _amountController = TextEditingController(text: widget.cardModel.amount.toString());
  }

  @override
  void dispose() {
    _ownerNameController.dispose();
    _cardNumberController.dispose();
    _expireDateController.dispose();
    _bankNameController.dispose();
    _cardNameController.dispose();
    _providerNameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Card'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _ownerNameController,
                decoration: InputDecoration(labelText: 'Owner Name'),
              ),
              TextField(
                controller: _cardNumberController,
                decoration: InputDecoration(labelText: 'Card Number'),
              ),
              TextField(
                controller: _expireDateController,
                decoration: InputDecoration(labelText: 'Expire Date'),
              ),
              TextField(
                controller: _bankNameController,
                decoration: InputDecoration(labelText: 'Bank Name'),
              ),
              TextField(
                controller: _cardNameController,
                decoration: InputDecoration(labelText: 'Card Name'),
              ),
              TextField(
                controller: _providerNameController,
                decoration: InputDecoration(labelText: 'Provider Name'),
              ),
              TextField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Amount'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Get the updated values from text controllers
                  final String ownerName = _ownerNameController.text;
                  final String cardNumber = _cardNumberController.text;
                  final String expireDate = _expireDateController.text;
                  final String bankName = _bankNameController.text;
                  final String cardName = _cardNameController.text;
                  final String providerName = _providerNameController.text;
                  final double amount = double.tryParse(_amountController.text) ?? 0.0;
        
                  // Create a new CardModel with the updated values
                  CardModel updatedCard = widget.cardModel.copyWith(
                    ownerName: ownerName,
                    cardNumber: cardNumber,
                    expireDate: expireDate,
                    bankName: bankName,
                    cardName: cardName,
                    providerName: providerName,
                    amount: amount,
                  );
        
                  // Dispatch an event to update the card using the Bloc
                  BlocProvider.of<CardsBloc>(context).add(UpdateCardEvent(updatedCard));
        
                  // Navigate back to the previous screen
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
