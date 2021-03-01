import 'package:classroom_gui/controllers/subject_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/subject_order_controller.dart';
import '../models/study_material.dart';
import '../models/subject.dart';

class StudyMaterialSearch extends SearchDelegate<StudyMaterial> {
  final List<StudyMaterial> studyMaterialList;

  StudyMaterialSearch(this.studyMaterialList);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          debugPrint("clear button clicked");
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // final titleList = studyMaterialList.map((studyMaterial)=>studyMaterial.title).toList();
    // final fuse = Fuzzy(titleList);
    // final result = fuse.search(query);
    final results = studyMaterialList
        .where((studyMaterial) =>
            studyMaterial.title.isCaseInsensitiveContains(query))
        .toList();
    return query != ''
        ? results.isNotEmpty
            ? Scrollbar(
                isAlwaysShown: true,
                child: ListView.builder(
                  itemCount: results.length,
                  padding: const EdgeInsets.all(20.0),
                  itemBuilder: (_, index) {
                    final material = results[index];
                    return CardTile(
                      material: material,
                      onTap: () async {
                        debugPrint("\n");
                        debugPrint(material.url.toString());
                        debugPrint(material.topicGroup);
                        debugPrint("\n");
                        await _launchURL(material.url.toString());
                      },
                    );
                  },
                ),
              )
            : const Center(
                child: Text('No Result'),
              )
        : Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
    // return query != ''
    //     ? Container(
    //         color: Colors.yellow,
    //         child: Text("suggestion : $query"),
    //       )
    //     : Container();
  }
}

class CardTile extends StatelessWidget {
  final StudyMaterial material;
  final VoidCallback onTap;

  const CardTile({
    Key key,
    @required this.material,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          material.title,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

class SubjectPage extends StatelessWidget {
  final Subject subject;

  const SubjectPage(this.subject);
  @override
  Widget build(BuildContext context) {
    final SubjectOrderController controller = Get.put(SubjectOrderController());
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: StudyMaterialSearch(subject.materials),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              controller.isReverse.toggle();
            },
          ),
        ],
      ),
      body: Obx(() {
        final isReverse = controller.isReverse.value;
        return subject.materials
                .every((material) => material.topicGroup != null)
            ? Scrollbar(
                isAlwaysShown: true,
                child: GroupedListView(
                  elements: subject.materials,
                  groupBy: (material) => material.topicGroup,
                  order: controller.isReverse.value
                      ? GroupedListOrder.ASC
                      : GroupedListOrder.DESC,
                  groupSeparatorBuilder: (groupValue) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 18.0),
                    child: Text(
                      groupValue.toString(),
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  itemBuilder: (_, material) => CardTile(
                    material: material as StudyMaterial,
                    onTap: () async {
                      // debugPrint("\n");
                      // debugPrint(material.url.toString());
                      // debugPrint("\n");
                      await _launchURL(material.url.toString());
                    },
                  ),
                ),
              )
            : Scrollbar(
                isAlwaysShown: true,
                child: ListView.builder(
                  itemCount: subject.materials.length,
                  padding: const EdgeInsets.all(20.0),
                  itemBuilder: (_, index) {
                    final length = subject.materials.length;
                    final material = subject
                        .materials[isReverse ? length - index - 1 : index];
                    return CardTile(
                      material: material,
                      onTap: () async {
                        // debugPrint("\n");
                        // debugPrint(material.url.toString());
                        // debugPrint(material.topicGroup);
                        // debugPrint("\n");
                        await _launchURL(material.url.toString());
                      },
                    );
                  },
                ),
              );
      }),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  // if (GetPlatform.isIOS) {
  //   if (await canLaunch(
  //       'youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw')) {
  //     await launch('youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
  //         forceSafariVC: false);
  //   } else {
  //     if (await canLaunch(
  //         'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw')) {
  //       await launch(
  //           'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw');
  //     } else {
  //       throw 'Could not launch https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw';
  //     }
  //   }
  // } else {
  // if (await canLaunch(url)) {
  //   await launch(url);
  // } else {
  //   throw 'Could not launch $url';
  // }
  // }
}
