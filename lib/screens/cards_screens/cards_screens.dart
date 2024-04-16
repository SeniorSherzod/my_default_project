import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_default_project/bloc/card_bloc.dart';
import '../../bloc/card_state.dart';
import '../../utils/extensions/extensions.dart';
import '../../utils/styles/app_text_style.dart';
import 'add_cards.dart';
import 'edit_screen.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to the AddCardScreen when the add button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddCardScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<CardsBloc, CardsState>(
        builder: (context, state) {
          if (state is CardLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CardsErrorState) {
            return Center(child: Text(state.errorText));
          } else if (state is CardSuccessState) {
            return ListView.builder(
              itemCount: state.cards.length,
              itemBuilder: (context, index) {
                final cardModel = state.cards[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to the EditCardScreen when a card is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditCardScreen(cardModel: cardModel),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Container(
                        height: height/4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.cyan
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      cardModel.ownerName,
                                      style: AppTextStyle.GilroyMedium.copyWith(fontSize: 25)),
                                  Text(
                                      cardModel.cardName,
                                      style: AppTextStyle.GilroyMedium.copyWith(fontSize: 25)),
                                ],
                              ),
                              SizedBox(height: 20,),
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
                              SizedBox(height: 20,),
                              Center(
                                child: Text(
                                    cardModel.cardNumber,
                                    style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20)),
                              ),
                              Center(
                                child: Text(
                                    cardModel.expireDate,
                                    style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20)),
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
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
