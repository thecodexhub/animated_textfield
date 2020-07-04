import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _opacityAnimation;
  Animation<Offset> _slideAnimation1, _slideAnimation2;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _slideAnimation1 = Tween(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
        .animate(_controller);
    _slideAnimation2 = Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
        .animate(_controller);
    Timer(Duration(milliseconds: 600), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "__NAVIGATE__",
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.deepPurpleAccent[100]],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SlideTransition(
                    position: _slideAnimation1,
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: Text(
                        "Hello,",
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  SlideTransition(
                    position: _slideAnimation2,
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: Text(
                        "Welcome to My App",
                        style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1.2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
