import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/theme_provider.dart';
import '../widgets/z_animated_toggle.dart';

import 'home_page.dart';

class AppThemeSelected extends StatefulWidget {
  @override
  _AppThemeSelectedState createState() => _AppThemeSelectedState();
}

class _AppThemeSelectedState extends State<AppThemeSelected>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    super.initState();
  }

  changeThemeMode(bool theme) {
    if (!theme) {
      _animationController.forward(from: 0.0);
    } else {
      _animationController.reverse(from: 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //Artık tema özelliklerine erişimimiz var
    final themeProvider = Provider.of<ThemeProvider>(context);
    changeThemeMode(themeProvider.isLightTheme);
    return Scaffold(
      key: _scaffoldKey,
      //appBar: CustomAppBar(title: 'Ana Sayfa'),
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: height * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Container(
                  width: width * 0.35,
                  height: width * 0.35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: themeProvider.themeMode().gradiend,
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight),
                  ),
                ),
                Transform.translate(
                  offset: Offset(30, 0),
                  child: ScaleTransition(
                    scale: _animationController.drive(
                      Tween<double>(begin: 0.0, end: 1.0).chain(
                        CurveTween(curve: Curves.decelerate),
                      ),
                    ),
                    alignment: Alignment.topRight,
                    child: Container(
                      width: width * .26,
                      height: width * .26,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: themeProvider.isLightTheme
                            ? Colors.white
                            : Color(0xFF26242e),
                      ),
                      child: themeProvider.isLightTheme
                          ? Icon(Icons.wb_sunny,
                              size: 35, color: Colors.orange.shade400)
                          : Icon(Icons.star,
                              size: 35,
                              color: themeProvider.themeMode().backgroundColor),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.1),
            Text(
              'Uygulamanın Temasını Seç',
              style:
                  TextStyle(fontSize: width * .06, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * 0.1),
            ZAnimatedToggle(
              values: ['Light', 'Dark'],
              onToggleCallBack: (v) async {
                await themeProvider.toggleThemeData();
                setState(() {});
                changeThemeMode(themeProvider.isLightTheme);
              },
            ),
            SizedBox(
              height: height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildDot(
                  width: width * 0.022,
                  height: width * 0.022,
                  color: const Color(0xFFd9d9d9),
                ),
                buildDot(
                  width: width * 0.055,
                  height: width * 0.022,
                  color: themeProvider.isLightTheme
                      ? Color(0xFF26242e)
                      : Colors.white,
                ),
                buildDot(
                  width: width * 0.022,
                  height: width * 0.022,
                  color: const Color(0xFFd9d9d9),
                ),
              ],
            ),
            // skip & next
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.04),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.025),
                        child: Text(
                          'Geç',
                          style: TextStyle(
                            fontSize: width * 0.045,
                            color: const Color(0xFF7c7b7e),
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      shape: CircleBorder(),
                      color: themeProvider.isLightTheme
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFF35303f),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: Icon(
                          Icons.arrow_forward,
                          color: themeProvider.isLightTheme
                              ? const Color(0xFF000000)
                              : const Color(0xFFFFFFFF),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Container buildDot({double width, double height, Color color}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: width,
      height: height,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color,
      ),
    );
  }
}
