import 'package:flutter/material.dart';

class SubjectSelectorModal extends StatelessWidget {
  final List<String> subjects;

  SubjectSelectorModal({required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(subjects[index]),
                    onTap: () {
                      Navigator.pop(context, subjects[index]);
                    },
                  );
                },
              ),
            ),
          ),
        ],
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
