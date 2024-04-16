import 'package:flutter/material.dart';

import '../../../data/models/card_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class CardListItem extends StatelessWidget {
  final CardModel card;

  const CardListItem({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 300,
        height: 200, // Adjust the height here as per your requirement
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:Colors.cyan,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.greenAccent,
            child: Icon(
              Icons.credit_card,
              color: Colors.white,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  card.cardName,
                  style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20,color: AppColors.black)
                ),
                Text(
                  ' ${card.cardNumber},', style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20,color: AppColors.black)
                ),
                Text(
                  '${card.bankName}', style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20,color: AppColors.black)
                ),
                Text(
                  ' ${card.expireDate}', style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20,color: AppColors.black)
                ),
                Text(
                    '${card.amount.toStringAsFixed(2)}', style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20,color: AppColors.black)
                ),
              ],
            ),
          ),


        ),
      ),
    );
  }
}
