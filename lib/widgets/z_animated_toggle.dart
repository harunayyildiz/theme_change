import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../models/theme_provider.dart';

class ZAnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallBack;

  const ZAnimatedToggle({
    Key key,
    @required this.values,
    @required this.onToggleCallBack,
  }) : super(key: key);
  @override
  _ZAnimatedToggleState createState() => _ZAnimatedToggleState();
}

class _ZAnimatedToggleState extends State<ZAnimatedToggle> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: width * .7,
      height: width * .13,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () async {
              widget.onToggleCallBack(1);
              final settings = await Hive.openBox('settings');
              await settings.put('isLighTheme', themeProvider.isLightTheme);
            },
            child: Container(
              width: width * .7,
              height: width * .13,
              decoration: ShapeDecoration(
                  color: themeProvider.themeMode().toggleBackgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * .1))),
              child: Row(
                  children: List.generate(
                      widget.values.length,
                      (index) => Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * .1),
                            child: Text(
                              widget.values[index],
                              style: TextStyle(
                                  fontSize: width * .05,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF918f95)),
                            ),
                          ))),
            ),
          ),
          AnimatedAlign(
            alignment: themeProvider.isLightTheme
                ? Alignment.centerLeft
                : Alignment.centerRight,
            duration: Duration(milliseconds: 350),
            curve: Curves.slowMiddle,
            child: Container(
              width: width * .35,
              height: width * .13,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                  color: themeProvider.themeMode().toggleButtonColor,
                  shadows: themeProvider.themeMode().shadow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * .1))),
              child: Text(
                themeProvider.isLightTheme
                    ? widget.values[0]
                    : widget.values[1],
                style: TextStyle(
                    fontSize: width * .045,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF918f95)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
