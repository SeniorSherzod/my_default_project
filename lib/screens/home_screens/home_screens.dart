import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/data/repository/file_repository.dart';
import 'package:my_default_project/screens/books.dart';
import 'package:open_filex/open_filex.dart';
import '../../bloc/file_manager_bloc.dart';
import '../../data/models/file_data_model.dart';
import '../../utils/colors/app_colors.dart';

class FileManagerScreen extends StatelessWidget {
  const FileManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("File Managaer Screen"),
        actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>BooksScreen()));
        }, icon: Icon(Icons.navigate_next_sharp))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: List.generate(
          context.read<FileRepository>().files.length,
              (index) {
            FileDataModel fileDataModel =
            context.read<FileRepository>().files[index];
            FileManagerBloc fileManagerBloc = FileManagerBloc();
            return BlocProvider.value(
              value: fileManagerBloc,
              child: BlocBuilder<FileManagerBloc, FileManagerState>(
                builder: (context, state) {
                  debugPrint("CURRENT MB: ${state.progress}");
                  return Column(
                    children: [
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                            child: Image.asset(fileDataModel.iconPath)),
                        title: Text(fileDataModel.fileName),
                        subtitle: Text(fileDataModel.fileUrl),
                        trailing: IconButton(
                          onPressed: () async {
                            if (state.newFileLocation.isEmpty) {
                              fileManagerBloc.add(
                                DownloadFileEvent(
                                  fileDataModel: fileDataModel,
                                ),
                              );
                            } else {
                              await OpenFilex.open(state.newFileLocation);
                            }
                          },
                          icon: Icon(
                            state.newFileLocation.isEmpty
                                ? Icons.download
                                : Icons.check,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: state.progress != 0,
                        child: LinearProgressIndicator(
                          value: state.progress,
                          backgroundColor: Colors.grey,
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}