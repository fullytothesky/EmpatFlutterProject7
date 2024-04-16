import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sixth_state2_project/models/preferences_state_model.dart';
import 'package:sixth_state2_project/models/parse_json.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreWidget extends StatefulWidget {
  const StoreWidget({super.key});

  @override
  State<StoreWidget> createState() => _StoreWidgetState();
}

class _StoreWidgetState extends State<StoreWidget> {
  late Future<List<Post>> futurePost;
  bool shimmer = false;

  Future _onRefresh() {
    setState(() {
      shimmer = true;
    });
    return Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) => setState(
        () {
          shimmer = false;
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return _onRefresh();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: Provider.of<PreferencesStateModel>(
                        context,
                        listen: true,
                      ).savedTheme ==
                      "light"
                  ? const Color.fromARGB(255, 181, 180, 176)
                  : Colors.black,
              expandedHeight: 150,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Знайдіть найближчий магазин",
                    style: GoogleFonts.golosText(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                background: const Image(
                  image: AssetImage('assets/img/apple_store.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            FutureBuilder<List<Post>>(
              future: futurePost,
              builder: (
                context,
                snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }, childCount: 1),
                  );
                } else if (snapshot.hasError) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (
                        context,
                        index,
                      ) {
                        return  Padding(
                          padding:const EdgeInsets.all(100.0),
                          child: Center(
                            child: Flexible(
                              child: Text(
                                "На жаль, не вдалося отримати дані із серверу, спробуйте ,будь ласка , пізніше",
                              style: TextStyle(color: Provider.of<PreferencesStateModel>(
                        context,
                        listen: true,
                      ).savedTheme ==
                      "light"
                  ? const Color.fromARGB(255, 0, 0, 0)
                  : const Color.fromARGB(255, 255, 255, 255),),),
                            ),
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  );
                } else {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (
                        context,
                        index,
                      ) {
                        final store = snapshot.data![index];
                        return shimmer == false
                            ? buildContent(
                                index,
                                snapshot,
                                context,
                                store,
                              )
                            : Shimmer.fromColors(
                                baseColor: Provider.of<PreferencesStateModel>(
                                          context,
                                          listen: true,
                                        ).savedTheme ==
                                        'light'
                                    ? const Color.fromARGB(255, 181, 180, 176)
                                    : const Color.fromARGB(255, 0, 0, 0),
                                highlightColor:
                                    Provider.of<PreferencesStateModel>(
                                              context,
                                              listen: true,
                                            ).savedTheme ==
                                            'light'
                                        ? Colors.black12
                                        : const Color.fromARGB(
                                            255, 100, 89, 89),
                                child: buildContent(
                                  index,
                                  snapshot,
                                  context,
                                  store,
                                ),
                              );
                      },
                      childCount: snapshot.data!.length,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding buildContent(int index, AsyncSnapshot<List<Post>> snapshot,
      BuildContext context, Post store) {
    var theme = Provider.of<PreferencesStateModel>(
      context,
      listen: true,
    ).savedTheme;
    return Padding(
      padding: (index == 0)
          ? const EdgeInsets.only(
              top: 30.0,
              right: 15.0,
              left: 15.0,
              bottom: 10,
            )
          : (index == snapshot.data!.length - 1)
              ? const EdgeInsets.only(
                  top: 10.0,
                  right: 15.0,
                  left: 15.0,
                  bottom: 30.0,
                )
              : const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  right: 15.0,
                  left: 15.0,
                ),
      child: Container(
        decoration: BoxDecoration(
          color: Provider.of<PreferencesStateModel>(
                    context,
                    listen: true,
                  ).savedTheme ==
                  "light"
              ? const Color.fromARGB(255, 181, 180, 176)
              : Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                store.image,
                height: 200,
                loadingBuilder: (
                  context,
                  child,
                  loadingProgress,
                ) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 100.0,
                          right: 100.0,
                        ),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                },
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    store.city,
                    style: TextStyle(
                      color: theme == 'light' ? Colors.black : Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    store.address,
                    style: TextStyle(
                      color: theme == 'light' ? Colors.black : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
