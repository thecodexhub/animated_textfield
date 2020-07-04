import 'package:animatedtextfield/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animated TextField',
      debugShowCheckedModeBanner: false,
      home: AnimatedTextfield(),
    );
  }
}

class AnimatedTextfield extends StatefulWidget {
  @override
  _AnimatedTextfieldState createState() => _AnimatedTextfieldState();
}

class _AnimatedTextfieldState extends State<AnimatedTextfield>
    with TickerProviderStateMixin {
  AnimationController _controller1, _controller2, _controller3;
  Animation<double> _opacityAnimation1, _tickAnimation1;
  Animation<Offset> _offsetAnimation1;

  AnimationController _controller4, _controller5, _controller6;
  Animation<double> _opacityAnimation2, _tickAnimation2;
  Animation<Offset> _offsetAnimation2;

  @override
  void initState() {
    super.initState();
    _controller1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller2.forward();
            }
            setState(() {});
          });
    _controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller2.repeat(reverse: true);
            }
            setState(() {});
          });
    _controller3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350))
          ..addStatusListener((status) {
            setState(() {});
          });
    _opacityAnimation1 = Tween(begin: 0.0, end: 1.0).animate(_controller1);
    _offsetAnimation1 = Tween(begin: Offset(0.0, 0.0), end: Offset(0.0, 0.25))
        .animate(_controller2);
    _tickAnimation1 = Tween(begin: 0.0, end: 1.0).animate(_controller3);

    _controller4 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller5.forward();
            }
            setState(() {});
          });
    _controller5 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller5.repeat(reverse: true);
            }
            setState(() {});
          });
    _controller6 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350))
          ..addStatusListener((status) {
            setState(() {});
          });
    _opacityAnimation2 = Tween(begin: 0.0, end: 1.0).animate(_controller4);
    _offsetAnimation2 = Tween(begin: Offset(0.0, 0.0), end: Offset(0.0, 0.25))
        .animate(_controller5);
    _tickAnimation2 = Tween(begin: 0.0, end: 1.0).animate(_controller6);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    super.dispose();
  }

  final bouncingBall = Container(
    height: 15.0,
    width: 15.0,
    decoration:
        BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurpleAccent),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 150.0),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: Text(
                "Sign in",
                style: TextStyle(
                    fontSize: 42.0,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                elevation: 3.0,
                child: Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextField(
                        onChanged: (string) {
                          _controller1.forward();
                        },
                        onSubmitted: (value) {
                          _controller1.reset();
                          _controller2.reset();
                          _controller3.forward();
                        },
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        decoration: InputDecoration(
                            hintText: "Enter email id",
                            hintStyle: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.normal),
                            suffixIcon: Stack(
                              children: <Widget>[
                                SlideTransition(
                                  position: _offsetAnimation1,
                                  child: FadeTransition(
                                    opacity: _opacityAnimation1,
                                    child: Container(
                                      height: 40.0,
                                      width: 40.0,
                                      child: Center(child: bouncingBall),
                                    ),
                                  ),
                                ),
                                FadeTransition(
                                  opacity: _tickAnimation1,
                                  child: Container(
                                    height: 40.0,
                                    width: 40.0,
                                    child: Center(
                                        child: Icon(
                                      Icons.done,
                                      size: 28.0,
                                      color: Colors.deepPurpleAccent,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurpleAccent))),
                        cursorColor: Colors.deepPurpleAccent,
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextField(
                        onChanged: (string) {
                          _controller4.forward();
                        },
                        onSubmitted: (value) {
                          _controller4.reset();
                          _controller5.reset();
                          _controller6.forward();
                        },
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.normal),
                          suffixIcon: Stack(
                            children: <Widget>[
                              SlideTransition(
                                position: _offsetAnimation2,
                                child: FadeTransition(
                                  opacity: _opacityAnimation2,
                                  child: Container(
                                    height: 40.0,
                                    width: 40.0,
                                    child: Center(child: bouncingBall),
                                  ),
                                ),
                              ),
                              FadeTransition(
                                opacity: _tickAnimation2,
                                child: Container(
                                  height: 40.0,
                                  width: 40.0,
                                  child: Center(
                                      child: Icon(
                                    Icons.done,
                                    size: 28.0,
                                    color: Colors.deepPurpleAccent,
                                  )),
                                ),
                              ),
                            ],
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ),
                        cursorColor: Colors.deepPurpleAccent,
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "or sign in using social media",
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue[800]),
                            child: Center(
                              child: Text(
                                "f",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(width: 15.0),
                          Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red[800]),
                            child: Center(
                              child: Text(
                                "G+",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Hero(
                  tag: "__NAVIGATE__",
                  child: Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurpleAccent,
                          Colors.deepPurpleAccent[100]
                        ],
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward,
                        size: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: Text(
                "By continuing, you agree to terms & conditions",
                style: TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}

