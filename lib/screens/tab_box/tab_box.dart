import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/screens/home_screen/add_qrcode_screen.dart';
import 'package:my_default_project/screens/home_screen/history_screen.dart';
import 'package:my_default_project/screens/home_screen/home_screens.dart';
import 'package:my_default_project/utils/images/app_images.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key});

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorScreenState();
}

class _BottomNavigatorScreenState extends State<BottomNavigatorScreen> {
  List<Widget> _screens = [];
  int _activeIndex = 0;

  @override
  void initState() {
    _screens = [
      QRCodeScreen(),
      QrScannerScreen(),// Placeholder for QRCodeScreen
      HistoryScreen()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _activeIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          setState(() {
            _activeIndex = newActiveIndex;
          });
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor:Colors.black38,
        items:  [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.generate, color: Theme.of(context).colorScheme.onSurface),
            icon: SvgPicture.asset(AppImages.generate),
            label: "Generate",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.qrcode, color: Theme.of(context).colorScheme.onSurface),
            icon: SvgPicture.asset(AppImages.qrcode),
            label: "Qr code",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.history, color: Theme.of(context).colorScheme.onSurface),
            icon: SvgPicture.asset(AppImages.history),
            label: "History",
          ),
        ],
      ),
    );
  }
}
