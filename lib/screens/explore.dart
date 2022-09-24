import 'package:flutter/material.dart';
import 'package:kwik/utils/constant.dart';

class Explorer extends StatefulWidget {
  const Explorer({Key? key}) : super(key: key);

  @override
  State<Explorer> createState() => _ExplorerState();
}

class _ExplorerState extends State<Explorer> {
  bool createquiz() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          backgroundColor: primarycolor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Container(
                height: 50,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100)))),
          ),
          flexibleSpace: Container(
            padding: const EdgeInsets.all(40),
            child: (TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search for quizzes here',
                  fillColor: const Color.fromARGB(106, 255, 255, 255),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.circular(20))),
            )),
          ),
        )
      ],
    );
  }
}
