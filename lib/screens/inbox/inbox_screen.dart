import 'package:flutter/material.dart';
import 'package:my_default_project/screens/inbox/widgets/update_ibox.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';

import '../../data/local/local_datebase.dart';
import '../../models/task_model/task_model.dart';
import '../../utils/styles/app_text_style.dart';
import 'dialog/item_view.dart';
class InboxScreen extends StatefulWidget {
  const InboxScreen({
    super.key,
    this.stream,
  });

  final Stream? stream;

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List<TaskModel> tasks = [];

  _init() async {
    tasks = await LocalDatabase.getAllTasks();
    setState(() {});
  }

  _searchQuery(String q) async {
    tasks = await LocalDatabase.searchTasks(q);
    setState(() {});
  }

  DateTime? dateTime;
  TimeOfDay? timeOfDay;

  @override
  void initState() {
    _init();
    if (widget.stream != null) {
      widget.stream!.listen((event) {
        _init();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("COLOR VALUE:${Colors.black.value}");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,//0xFF000000
        title: const Text("In Box"),
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.blue,
        onRefresh: () {
          _init();
          return Future<void>.delayed(const Duration(seconds: 2));
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w,right: 20.w),
              child: TextField(
                onChanged: _searchQuery,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).cardColor,
                  filled: true,
                  hintText: "Search your to do here",
                  helperStyle: AppTextStyle.GilroyMedium.copyWith
                    (color: AppColors.main, fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.main
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: AppColors.main
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.white,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.white,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: List.generate(
                  tasks.length,
                      (index) {
                    TaskModel taskModel = tasks[index];
                    return TaskItemView(
                      onStatusUpdate: () async {
                        await LocalDatabase.updateTaskStatus(
                          newStatus: "done",
                          taskId: taskModel.id!,
                        );
                        _init();
                      },
                      taskModel: taskModel,
                      onDelete: () async {
                        int d = await LocalDatabase.deleteTask(taskModel.id!);
                        debugPrint("DELETED ID:$d");
                        _init();
                      },
                      onUpdate: () {
                        updateTaskDialog(
                          context: context,
                          task: taskModel,
                          taskModelChanged: (updatedTask) async {
                            await LocalDatabase.updateTask(
                              updatedTask.copyWith(id: taskModel.id),
                              taskModel.id!,
                            );
                            _init();
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}