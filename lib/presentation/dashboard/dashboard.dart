import 'package:economic/config/theme/themeProvider.dart';
import 'package:economic/widget/bottom_custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../common/Contants/common.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widget/languageWidget.dart';
class DashBoard extends StatelessWidget {
  static const String routeName = '/dashboard';

  final userBox = Hive.box(AUTHENTICATION_BOX);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppLocalizations.of(context)!.login,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}

class ModeToggleButton extends StatefulWidget {
  @override
  _ModeToggleButtonState createState() => _ModeToggleButtonState();
}

class _ModeToggleButtonState extends State<ModeToggleButton> {
  Size get s => MediaQuery.of(context).size;
  int isOn = 0;

  @override
  Widget build(BuildContext context) {
    bool _darkModeEnabled = Theme.of(context).brightness == Brightness.dark;
    _darkModeEnabled ? isOn = 1 : isOn = 0;
    return AnimatedContainer(
      duration: Duration(milliseconds: 360),
      width: s.width / 2,
      height: s.height / 4,
      color: Colors.transparent,
      child: Center(
        child: GestureDetector(
          onTap: () {
            HapticFeedback.mediumImpact();
            Provider.of<ThemeProvider>(context, listen: false).toggleMode();
            setState(() {
              isOn == 0 ? isOn = 1 : isOn = 0;
            });
          },
          child: Container(
            width: s.width / 4,
            height: s.width * 0.125,
            decoration: BoxDecoration(
              color: Color(0xff27173A),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: Duration(milliseconds: 360),
                  top: 0,
                  left: 0 + (s.width * 0.125) * isOn,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: s.width * 0.125 - 16,
                      height: s.width * 0.125 - 16,
                      decoration: BoxDecoration(
                        color: Color(0xffFFC209),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 360),
                  top: isOn == 0 ? (s.width * 0.125 - 8) / 2 : 8,
                  left: 0 + (s.width * 0.125 - 8) * isOn,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 360),
                    width: 8 + (s.width * 0.125 - 24) * isOn,
                    height: 8 + (s.width * 0.125 - 24) * isOn,
                    decoration: BoxDecoration(
                      color: Color(0xff27173A),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
