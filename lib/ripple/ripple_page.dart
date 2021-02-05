import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rect_getter/rect_getter.dart';

import 'custop_paint.dart';

class RipplePage extends StatefulWidget {
  @override
  _RipplePageState createState() => _RipplePageState();
}

class _RipplePageState extends State<RipplePage> {
  GlobalKey rectGetterKey = RectGetter.createGlobalKey();

  Rect rect;

  final Duration animationDuration = Duration(milliseconds: 300);
  final Duration delay = Duration(milliseconds: 300);

  void _onPressed() {
    setState(() {
      rect = RectGetter.getRectFromKey(rectGetterKey);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        return rect =
            rect.inflate(1.3 * MediaQuery.of(context).size.longestSide);
      });

      Future.delayed(animationDuration + delay, _gotoNextSreen);
    });
  }

  void _gotoNextSreen() {
    //  Navigator.of(context).push(FadeRouteBuilder(page: SecondPage())).then((_) => setState(()=> rect = null));
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => SecondPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text("Ripple Page"),
          ),
          floatingActionButton: FloatingActionButton(
            key: rectGetterKey,
            child: Text("Ripple"),
            onPressed: _onPressed,
          ),
        ),
        _ripple(),
      ],
    );
  }

  Widget _ripple() {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: animationDuration,
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.height - rect.bottom,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.centerLeft,
            // stops: [
            //   1.8,
            //   0.7,
            // ],
            colors: [
              kSplashBgEndColor,
              kSplashBgStartColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Positioned(
            //     // height: 30,
            //     right: 0,
            //     left: 0,
            //     child: SvgPicture.asset(
            //       kLoginSvg,
            //       fit: BoxFit.fitHeight,
            //       width: 100,
            //     )),

            Positioned(
              right: MediaQuery.of(context).size.width / 3,
              bottom: 30,
              child: Text('PORTER',
                  style: Get.textTheme.headline5.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2)),
            ),
            Positioned(
              height: 100,
              bottom: 100,
              left: -170,
              child: CustomPaint(
                painter: SplashCustomPaint(),
              ),
            ),
            Positioned(
              left: -200,
              top: -500,
              right: 300,
              bottom: -100,
              child: CustomPaint(
                painter: SplashCustom2Paint(),
              ),
            ),
            Positioned(
              // height: 30,
              right: 0,
              left: 0,
              bottom: 0,
              top: 0,
              child: Icon(Icons.ac_unit),
            ),
            // _ripple()
          ],
        ),
      ),
    );
  }
}

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadeRouteBuilder({this.page})
      : super(
          pageBuilder: (context, animation1, animation2) => page,
          transitionsBuilder: (context, animation1, animation2, child) =>
              FadeTransition(
            opacity: animation1,
            child: child,
          ),
        );
}
