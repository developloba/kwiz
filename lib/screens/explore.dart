import 'package:flutter/material.dart';
import 'package:kwik/utils/carousel_manager.dart';
import 'package:kwik/utils/constant.dart';
import 'package:kwik/utils/firestorage.dart';

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
          collapsedHeight: 150,
          expandedHeight: 150,
          pinned: true,
          backgroundColor: primarycolor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Center(
              child: Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100)))),
            ),
          ),
          flexibleSpace: Container(
            padding: const EdgeInsets.all(40),
            child: (TextField(
              style: const TextStyle(
                  color: Colors.white, decoration: TextDecoration.none),
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
              Padding(
                padding: const EdgeInsets.all(10),
                child: Genre(carouselmamager: categories),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'New Releases',
                          style: TextStyle(fontSize: 25),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.grey)
                      ],
                    ),
                    NewRelease(categories: categories)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class NewRelease extends StatelessWidget {
  const NewRelease({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final Carousel categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 530,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: PageView.builder(
            padEnds: false,
            controller: PageController(viewportFraction: 0.8),
            itemCount: categories.Newreleases.length,
            itemBuilder: ((context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    SizedBox(
                      width: 500,
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Stack(fit: StackFit.expand, children: [
                            categories.Newreleases[index],
                            Positioned(
                              top: 300,
                              left: 320,
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        backgroundColor: primarycolor,
                                        elevation: 0),
                                    onPressed: () {},
                                    child: const Center(
                                        child: Icon(
                                      Icons.play_arrow,
                                      size: 20,
                                    ))),
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        categories.newdescription[index],
                        style:
                            const TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            categories.ratings[index].toString(),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.grey),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.auto_awesome,
                              color: Colors.amber,
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ))),
      ),
    );
  }
}
