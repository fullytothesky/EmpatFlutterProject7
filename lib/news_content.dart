import 'package:flutter/material.dart';
import 'package:sixth_state2_project/models/preferences_state_model.dart';
import 'package:provider/provider.dart';


class NewsWidget extends StatelessWidget {
  late String content;
  late String heading;
  late String image;
  NewsWidget(
      {super.key,
      required this.content,
      required this.image,
      required this.heading});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<PreferencesStateModel>(
      context,
      listen: true,
    ).savedTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, "Відвідано");
          },
        ),
      ),
      body: ListView(
        children: [
          Image.network(image),
          Padding(
            padding: const EdgeInsets.only(
              top: 24.0,
              left: 18.0,
              right: 18.0,
            ),
            child: Text(
              heading,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: theme == 'light' ? Colors.black : Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              right: 18.0,
              top: 16,
              bottom: 20,
            ),
            child: Text(
              content,
              style: TextStyle(
                fontSize: 17,
                color: theme == 'light' ? Colors.black : Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
