import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/theme_provider.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSize {
  String title;
  Widget widgetLeft;
  Widget widgetRight;
  CustomAppBar({@required this.title, this.widgetLeft, this.widgetRight});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return PreferredSize(
        child: Container(
          height: width * .20,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            color: themeProvider.isLightTheme
                ? Colors.white
                : themeProvider.themeMode().toggleBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widgetLeft ?? SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 25),
                      ),
                    ),
                    widgetRight ?? SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(100));
  }

  @override
  Widget get child => throw UnimplementedError();
  @override
  Size get preferredSize => Size(100, 100);
}
