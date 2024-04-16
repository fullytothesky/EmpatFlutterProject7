import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sixth_state2_project/models/preferences_state_model.dart';

class PreferencesWidget extends StatefulWidget {
  const PreferencesWidget({super.key});

  @override
  State<PreferencesWidget> createState() => _PreferencesWidgetState();
}

class _PreferencesWidgetState extends State<PreferencesWidget> {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<PreferencesStateModel>(
      context,
      listen: true,
    ).savedTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              bottom: 15.0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Змінити нікнейм:",
                        style: TextStyle(
                          fontSize: 18,
                          color: theme == 'light' ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        style: TextStyle(
                          color: theme == 'light' ? Colors.black : Colors.white,
                        ),
                        maxLength: 12,
                        onSubmitted: (value) {
                          Provider.of<PreferencesStateModel>(
                            context,
                            listen: false,
                          ).setUsername(value);
                        },
                        decoration: const InputDecoration(
                          counterText: '',
                          hintText: "Введіть тут...",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Тема застосунку",
                  style: TextStyle(
                    fontSize: 18,
                    color: theme == 'light' ? Colors.black : Colors.white,
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    "Змінити",
                    style: GoogleFonts.golosText(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {
                    var provider = Provider.of<PreferencesStateModel>(
                      context,
                      listen: false,
                    );
                    var currentTheme = provider.savedTheme;
                    if (currentTheme == 'light') {
                      provider.setTheme('dark');
                    } else {
                      provider.setTheme('light');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
