// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_default_project/screens/security_screen/widgets/checking_button.dart';
// import 'package:my_default_project/screens/security_screen/widgets/numbers_button.dart';
// import 'package:my_default_project/utils/colors/app_colors.dart';
// import 'package:my_default_project/utils/styles/app_text_style.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:my_default_project/screens/demo_screens/demo_screens.dart';
//
// import '../../data/models/digit_model.dart';
//
// class SecurityPass extends StatefulWidget {
//   const SecurityPass({Key? key}) : super(key: key);
//
//   @override
//   State<SecurityPass> createState() => _SecurityPassState();
// }
//
// class _SecurityPassState extends State<SecurityPass> {
//   late SharedPreferences _prefs;
//   late bool _isFirstTime;
//
//   @override
//   void initState() {
//     super.initState();
//     _initPreferences();
//   }
//
//   Future<void> _initPreferences() async {
//     _prefs = await SharedPreferences.getInstance();
//     _isFirstTime = _prefs.getBool('isFirstTime') ?? true;
//   }
//
//   void _onDigitPressed(String digit) {
//     BlocProvider.of<PinCubit>(context).insertDigit(digit);
//     debugPrint(digit);
//   }
//
//   void _insertDelete(String value) {
//     if (value == 'del') {
//       BlocProvider.of<PinCubit>(context).insertDelete(value);
//     }
//   }
//
//   void _navigateToCountriesScreen() {
//     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => CountriesScreen()));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => PinCubit(),
//       child: BlocBuilder<PinCubit, DigitModel>(
//         builder: (context, state) {
//           return Scaffold(
//             backgroundColor: AppColors.black,
//             appBar: AppBar(
//               title: Text("Security"),
//               backgroundColor: AppColors.black,
//             ),
//             body: Column(
//               children: [
//                 SizedBox(height: 60),
//                 Text(
//                   "Enter your passcode",
//                   style: AppTextStyle.GilroyMedium.copyWith(
//                     color: AppColors.white,
//                     fontSize: 25,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 300,
//                       height: 50,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           checkButton(state.pin.length == 4 ? Colors.green : Colors.grey, () {}, context),
//                           checkButton(state.pin.length >= 1 ? Colors.green : Colors.grey, () {}, context),
//                           checkButton(state.pin.length >= 2 ? Colors.green : Colors.grey, () {}, context),
//                           checkButton(state.pin.length >= 3 ? Colors.green : Colors.grey, () {}, context),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 140),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                             numberButton("1", AppColors.c_7C7C7C, () => _onDigitPressed("1"), context),
//                             SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                             numberButton("2", AppColors.c_7C7C7C, () => _onDigitPressed("2"), context),
//                             SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                             numberButton("3", AppColors.c_7C7C7C, () => _onDigitPressed("3"), context),
//                           ],
//                         ),
//                         SizedBox(height: 15),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                             numberButton("4", AppColors.c_7C7C7C, () => _onDigitPressed("4"), context),
//                             SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                             numberButton("5", AppColors.c_7C7C7C, () => _onDigitPressed("5"), context),
//                             SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                             numberButton("6", AppColors.c_7C7C7C, () => _onDigitPressed("6"), context),
//                           ],
//                         ),
//                         SizedBox(height: 15),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                             numberButton("7", AppColors.c_7C7C7C, () => _onDigitPressed("7"), context),
//                             SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                             numberButton("8", AppColors.c_7C7C7C, () => _onDigitPressed("8"), context),
//                             SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                             numberButton("9", AppColors.c_7C7C7C, () => _onDigitPressed("9"), context),
//                           ],
//                         ),
//                         SizedBox(height: 15),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                             numberButton("f", AppColors.c_7C7C7C, () => _onDigitPressed("f"), context),
//                             SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                             numberButton("0", AppColors.c_7C7C7C, () => _onDigitPressed("0"), context),
//                             SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                             numberButton("del", AppColors.c_7C7C7C, () => _insertDelete("del"), context),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             floatingActionButton: state.pin.length == 4
//                 ? FloatingActionButton(
//               onPressed: () {
//                 if (_isFirstTime) {
//                   _prefs.setBool('isFirstTime', false);
//                   _navigateToCountriesScreen();
//                 } else {
//                   // Check the entered password
//                   String savedPassword = _prefs.getString('password') ?? '';
//                   if (state.pin == savedPassword) {
//                     _navigateToCountriesScreen();
//                   } else {
//                     // Incorrect password entered
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('Incorrect password! Please try again.'),
//                         duration: Duration(seconds: 2),
//                       ),
//                     );
//                   }
//                 }
//               },
//               child: Icon(Icons.arrow_forward),
//             )
//                 : null,
//           );
//         },
//       ),
//     );
//   }
// }
//
