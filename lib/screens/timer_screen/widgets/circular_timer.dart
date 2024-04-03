import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_default_project/screens/timer_screen/widgets/select_subjects.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';
import 'button_timer.dart';

class CircularTimer extends StatefulWidget {
  const CircularTimer({Key? key}) : super(key: key);

  @override
  _CircularTimerState createState() => _CircularTimerState();
}

class _CircularTimerState extends State<CircularTimer> {
  int _duration = 60;
  final CountDownController _controller = CountDownController();
  String? _selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularCountDownTimer(
          duration: _duration,
          initialDuration: 0,
          controller: _controller,
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          ringColor: Colors.grey[300]!,
          ringGradient: null,
          fillColor: AppColors.c_7C7C7C,
          fillGradient: null,
          backgroundColor: AppColors.white,
          backgroundGradient: null,
          strokeWidth: 20.0,
          strokeCap: StrokeCap.round,
          textStyle: const TextStyle(
            fontSize: 33.0,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
          textFormat: CountdownTextFormat.S,
          isReverse: true,
          isReverseAnimation: false,
          isTimerTextShown: true,
          autoStart: false,
          onStart: () {
            debugPrint('Countdown Started');
          },
          onComplete: () {
            debugPrint('Countdown Ended');
          },
          onChange: (String timeStamp) {
            debugPrint('Countdown Changed $timeStamp');
          },
          timeFormatterFunction: (defaultFormatterFunction, duration) {
            if (duration.inSeconds == 0) {
              return "0";
            } else {
              return Function.apply(defaultFormatterFunction, [duration]);
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 30,
            ),
            button(
              title: "Start",
              onPressed: () => _controller.start(),
            ),
            const SizedBox(
              width: 10,
            ),
            button(
              title: "Pause",
              onPressed: () => _controller.pause(),
            ),
            const SizedBox(
              width: 10,
            ),
            button(
              title: "Resume",
              onPressed: () => _controller.resume(),
            ),
            const SizedBox(
              width: 10,
            ),
            button(
              title: "Restart",
              onPressed: () => _controller.restart(duration: _duration),
            ),
          ],
        ),
        SizedBox(height: 30,),
        Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey
          ),
          child: TextButton(
            onPressed: () {
              showSubjectSelectorModal(context).then((selectedSubject) {
                // Handle the selected subject here
                setState(() {
                  _selectedSubject = selectedSubject;
                });
              });
            },
            child: Text(
              "Choose Subject",
              style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20),
            ),
          ),
        ),
        SizedBox(height: 20,),
        _selectedSubject != null ?
        Text(
          'Selected Subject: $_selectedSubject',
          style: TextStyle(fontSize: 16),
        ) :
        Container(),
      ],
    );
  }
}

 showSubjectSelectorModal(BuildContext context) async {
  List<String> subjects = ['Math', 'Science', 'History', 'English', 'Art'];
  String? selectedSubject = await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SubjectSelectorModal(subjects: subjects);
    },
  );
  return selectedSubject;
}
