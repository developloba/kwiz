import 'package:flutter/material.dart';
import 'package:kwik/utils/carousel_manager.dart';
import 'package:kwik/utils/constant.dart';

class Explorer extends StatefulWidget {
  const Explorer({Key? key}) : super(key: key);

  @override
  State<Explorer> createState() => _ExplorerState();
}

class _ExplorerState extends State<Explorer> {
  Carousel categories = Carousel();

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
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search for quizzes here',
                  hintStyle: const TextStyle(color: Colors.white),
                  fillColor: ksearchtextfeildcolor,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ksearchtextfeildcolor,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ksearchtextfeildcolor,
                      ),
                      borderRadius: BorderRadius.circular(20))),
            )),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Categories',
                  style: heading2,
                ),
              ),
              SizedBox(
                width: 500,
                height: 700,
                child: ListView.builder(
                    itemCount: categories.genres.length,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.all(15),
                          child: Card(
                              clipBehavior: Clip.hardEdge,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: categories.genres[index]),
                        ))),
              ),
            ],
          ),
        )
      ],
    );
  }
}
