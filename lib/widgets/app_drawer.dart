import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/control_page.dart';
import 'package:flutter_application_1/pages/parameter_chart_page.dart';

import 'package:flutter_application_1/services/appstate.dart';
import 'package:flutter_application_1/services/translations.dart';

import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/settings_page.dart';

import 'package:flutter_application_1/widgets/control_card.dart';
import 'package:flutter_application_1/widgets/parameter_chart.dart';
class AppDrawer extends StatefulWidget {
  final AppState appState;
  const AppDrawer({
    super.key,
    required this.appState,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Header of the Drawer
            Material(
              color: const Color(0xFF386150),
              child: InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()),);
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top, bottom: 24),
                  child: const Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('images/eyy.png'),
                        minRadius: 105,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'KabuTech',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Header Menu items
            Column(
              children: [
                Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.home_outlined,
                        size: 36,
                      ),
                      title: Text(
                        translations['home']
                            [widget.appState.settings['language']],
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => HomePage(
                                  appState: widget.appState,
                                )),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.settings,
                        size: 32,
                      ),
                      title: Text(
                        translations['settings']
                            [widget.appState.settings['language']],
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) =>
                                SettingsPage(appState: widget.appState)),
                          ),
                        );
                      },
                    ),
                    const Divider(color: Colors.black45),
                    ListTile(
                      leading: const Icon(
                        Icons.toggle_off_rounded,
                        size: 32,
                      ),
                      title: Text(
                        translations['control']
                            [widget.appState.settings['language']],
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => ControlPage(
                                  appState: widget.appState,
                                )),
                          ),
                        );
                      },
                    ),
                     ListTile(
                      leading: const Icon(
                        Icons.show_chart,
                        size: 32,
                      ),
                      title: Text(
                        translations['chart']
                            [widget.appState.settings['language']],
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => ParameterChartPage(
                                  appState: widget.appState,
                                )),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
