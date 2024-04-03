import 'package:flutter/material.dart';
import 'package:my_default_project/screens/timer_screen/set_timer.dart';
import 'package:my_default_project/screens/timer_screen/widgets/circular_timer.dart';
import 'package:my_default_project/screens/timer_screen/widgets/select_subjects.dart';
import 'package:my_default_project/utils/images/app_images.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

class SelectType extends StatelessWidget {
  const SelectType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset(AppImages.img),
                ),
              ],
            ),
            SizedBox(height: 50),
            CircularTimer(),
            SizedBox(height: 50),
            Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SetTimer()), // Replace NextScreen with your desired screen
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                    ),
                  ),
                ),
                child: Text(
                  "Next",
                  style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20, color: Colors.white),
                ),
              ),


            ),
          ],
        ),
      ),
    );
  }
}

void showSubjectSelectorModal(BuildContext context) {
  List<String> subjects = ['Math', 'Science', 'History', 'English', 'Art'];
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SubjectSelectorModal(subjects: subjects);
    },
  );
}
