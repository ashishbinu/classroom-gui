import 'package:get/state_manager.dart';

import '../services/remote_services.dart';

class SubjectController extends GetxController {
  final subjects = [].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSubjects();
  }

  Future<void> fetchSubjects({bool onRefresh = false}) async {
    try {
      if (!onRefresh) isLoading(true);
      final classroom = await RemoteServices.fetchSubjects();
      subjects.assignAll(classroom.subjects!);
    } finally {
      isLoading(false);
    }
  }
}
