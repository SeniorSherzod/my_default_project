import 'package:flutter/material.dart';
import 'package:my_default_project/view_models/increase_number.dart';
import 'package:provider/provider.dart';

import '../../utils/styles/app_text_style.dart';

class IncreaseNumber extends StatefulWidget {
  const IncreaseNumber({super.key});

  @override
  State<IncreaseNumber> createState() => _IncreaseNumberState();
}

class _IncreaseNumberState extends State<IncreaseNumber> {
  final NumberViewModel numberViewModel = NumberViewModel();

  @override
  Widget build(BuildContext context) {
    print("Painted");
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => numberViewModel,
        child: Consumer<NumberViewModel>(
          builder: (context, viewModel, child) {
            return Center(
              child: Text(
                "sec:${context.watch<NumberViewModel>().counter}",
                style: AppTextStyle.GilroyThin.copyWith(fontSize: 25),
              ),
            );
          },
        ),
      ),
    );
  }
}
