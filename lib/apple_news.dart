import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sixth_state2_project/news_container.dart';
import 'package:sixth_state2_project/models/news_handler.dart';
import 'package:sixth_state2_project/models/preferences_state_model.dart';
import 'package:provider/provider.dart';

class AppleNews extends StatefulWidget {
  const AppleNews({super.key});

  @override
  State<AppleNews> createState() => _AppleNewsState();
}

class _AppleNewsState extends State<AppleNews> {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<PreferencesStateModel>(
      context,
      listen: true,
    ).savedTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: theme == 'dark'
                ? const Color.fromARGB(255, 38, 33, 33)
                : const Color.fromARGB(255, 181, 180, 176),
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(
                  bottom: 1.0,
                  right: 15.0,
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Apple Новини",
                    style: GoogleFonts.golosText(
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: theme == 'dark'
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ),
              background: const Image(
                image: AssetImage('assets/img/apple_news.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: index == 0
                    ? const EdgeInsets.only(
                        top: 25.0,
                        left: 15.0,
                        right: 15.0,
                      )
                    : (index == NewsHandler.headers.length - 1)
                        ? const EdgeInsets.only(
                            top: 15,
                            bottom: 25.0,
                            left: 15.0,
                            right: 15.0,
                          )
                        : const EdgeInsets.only(
                            top: 15,
                            left: 15,
                            right: 15,
                          ),
                child: AppleNewsContainer(
                  newsHeading: NewsHandler.headers[index],
                  img: NewsHandler.images[index],
                  contentText: NewsHandler.content[index],
                ),
              );
            }, childCount: NewsHandler.headers.length),
          )
        ],
      ),
    );
  }
}
