import 'package:flutter/material.dart';

import 'package:sixth_state2_project/models/preferences_state_model.dart';
import 'package:provider/provider.dart';
import 'package:sixth_state2_project/news_content.dart';

class AppleNewsContainer extends StatefulWidget {
  String newsHeading; String img; String contentText;
   AppleNewsContainer({super.key , required this.newsHeading,required this.img,required this.contentText,});

  @override
  State<AppleNewsContainer> createState() => _AppleNewsContainerState();
}

class _AppleNewsContainerState extends State<AppleNewsContainer> {
 String result = '';
 bool isVisited = false;
    
     @override
  Widget build(BuildContext context) {
    
    var theme = Provider.of<PreferencesStateModel>(
      context,
      listen: true,
    ).savedTheme;
      return GestureDetector(
        onTap: () async {
          result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsWidget(
                  content: widget.contentText,
                  image: widget.img,
                  heading: widget.newsHeading,
                ),
              ));
          setState(() {
            isVisited = true;
          });
        },
        child: AnimatedContainer(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (theme == 'light' && !isVisited)
                  ? const Color.fromARGB(255, 181, 180, 176)
                  : (theme == 'dark' && !isVisited)
                      ? Colors.black
                      : const Color.fromARGB(255, 96, 91, 91)),
          duration: const Duration(seconds: 1),
          height: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    widget.img,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                     if (loadingProgress == null) return child;
                  return const SizedBox(
                    height: 350,
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
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:15.0, top:8.0, bottom:12.0),
                        child: Text(
                          widget.newsHeading,textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color:
                                theme == 'light' ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            result,
                            style: TextStyle(fontWeight: FontWeight.w100,
                                color: theme == 'light'
                                    ? Colors.black
                                    : Colors.white),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
  }
}
