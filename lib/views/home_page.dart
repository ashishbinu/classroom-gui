import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/subject_controller.dart';
import '../models/subject.dart';
import './setting_page.dart';
import './subject_page.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SubjectController controller = Get.put(SubjectController());
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => {Get.to(SettingPage())},
            ),
          )
        ],
      ),
      body: Obx(
        () {
          return Stack(
            children: [
              RefreshIndicator(
                onRefresh: () => controller.fetchSubjects(onRefresh: true),
                child: ListView.builder(
                    itemCount: controller.subjects.length,
                    padding: const EdgeInsets.all(20.0),
                    itemBuilder: (_, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            controller.subjects[index].title as String,
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () => _onTapItem(
                              context, controller.subjects[index] as Subject),
                        ),
                      );
                    }),
              ),
              if (controller.isLoading.value)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }

  void _onTapItem(BuildContext context, Subject subject) {
    debugPrint("____ON TO SECOND SCREEN __________");
    Get.to(SubjectPage(subject));
  }
}
