import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import '../../bloc/card_bloc.dart';
import '../../bloc/card_event.dart';
import '../../bloc/card_state.dart';
import '../../data/models/card_model.dart';
import '../../utils/styles/app_text_style.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  late CardModel senderCard;
  late CardModel recipientCard;
  double transferAmount = 0.0;

  @override
  void initState() {
    super.initState();
    // Initialize sender and recipient cards with the first card from state if available
    if (context.read<CardsBloc>().state is CardSuccessState) {
      List<CardModel> cards = (context.read<CardsBloc>().state as CardSuccessState).cards;
      if (cards.isNotEmpty) {
        senderCard = cards.first;
        recipientCard = cards.last;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer"),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<CardsBloc, CardsState>(
          builder: (context, state) {
            if (state is CardLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CardsErrorState) {
              return Center(child: Text(state.errorText));
            } else if (state is CardSuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display sender card
                  Text(
                    "Sender Card",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  _buildCardCarousel(state.cards, true),
                  const SizedBox(height: 20),
                  // Display recipient card
                  Text(
                    "Recipient Card",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  _buildCardCarousel(state.cards, false),
                  const SizedBox(height: 20),
                  // Enter transfer amount
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Enter Amount'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          transferAmount = double.tryParse(value) ?? 0.0;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Perform transfer button
                  ElevatedButton(
                    onPressed: () {
                      _performTransfer();
                    },
                    child: Text('Transfer'),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildCardCarousel(List<CardModel> cards, bool isSender) {
    return CarouselSlider.builder(
      itemCount: cards.length,
      itemBuilder: (context, index, realIndex) {
        final cardModel = cards[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              isSender ? senderCard = cardModel : recipientCard = cardModel;
            });
          },
          child: Card(
            child:Container(
                height: height/4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.cyan
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              cardModel.ownerName,
                              style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20)),
                          Text(
                              cardModel.cardName,
                              style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              cardModel.cardName,
                              style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20)),
                          Text(
                              cardModel.bankName,
                              style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Center(
                        child: Text(
                            cardModel.cardNumber,
                            style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20)),
                      ),
                      Center(
                        child: Text(
                            cardModel.expireDate,
                            style: AppTextStyle.GilroyMedium.copyWith(fontSize: 15)),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                            NumberFormat.currency(locale: "uz")
                                .format(cardModel.amount),
                            style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20)),
                      ),
                    ],
                  ),
                )
            ),
          ),
        );
      },
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        initialPage: 0,
        autoPlay: false,
      ),
    );
  }

  void _performTransfer() {
    if (transferAmount >= 1000) {
      _showErrorSnackBar("Please enter a valid transfer amount.");
      return;
    }

    // Check if sender and recipient cards are the same
    if (senderCard == recipientCard) {
      _showErrorSnackBar("Sender and recipient cards cannot be the same.");
      return;
    }

    // Check if sender card has enough balance
    if (senderCard.amount < transferAmount) {
      _showErrorSnackBar("Insufficient funds in the sender card.");
      return;
    }

    // Perform transfer logic here
    // Example: Deduct transferAmount from senderCard and add to recipientCard
    senderCard.amount -= transferAmount;
    recipientCard.amount += transferAmount;

    // Display success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Transfer successful."),
        backgroundColor: Colors.green,
      ),
    );

    // Reset transfer amount
    setState(() {
      transferAmount = 0.0;
    });

    // Optionally, you can navigate back to the previous screen
    Navigator.pop(context);
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
