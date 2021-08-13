import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Following is the integer that will look into the state of the page
  // 0==> Get started screen 1==> The login Page UI 2==> The register page UI
  //Managing all the three UIs in one page
  int _pageState = 0;

  //Folowing is the var to hold, the background color for the login and sign up page
  //White by default as requiored by tge get started screen
  var _backgroundColor = Colors.white;

  //Following is the variable, which will manage the color which we use for the heading
  var _headingColor = Color(0xFFB40284A);

  double loginWidth = 0;
  double loginHeight = 0;
  double registerHeight = 0;
  double loginYoffSet = 0;
  double loginXoffSet = 0;
  double registerYoffSet = 0;

  //Following are teh variables, that we will be using to control the wisth and height
  double windowWidth = 0;
  double windowHeight = 0;

  //Now, following is the variable we will use to control the opacity of teh variable
  double _loginOpacity =
      1; //Set to be 1 initially, as initially it needs to be fully visible

  //Following is the variable, for the visibility of the keyboard
  bool _keyBoardVisible = false;

  @override
  void initState() {
    super.initState();

    //Following is the code under external package used ==> FLUTTER_KEYBOARD_VISIBILITY under pub.dev
    var keyboardVisibilityController = KeyboardVisibilityController();
    // Query
    print(
        'Keyboard visibility direct query: ${keyboardVisibilityController.isVisible}');

    //Here, we get to know, if keyboard is visible or not
    keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        _keyBoardVisible = visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //Getting the width and height
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    //Getting the login height and substracting 270 (i.e heightg takenj for the heading) from top
    loginHeight = windowHeight - 270;
    registerHeight = windowHeight - 270;

    //Managing teh background color according to the screen
    switch (_pageState) {
      case 0:
        //On get started screen, hence we need the default color
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);
        //As it is on get strted scree, loginYoffset should be on window heigh

        loginYoffSet = windowHeight;
        loginXoffSet = 0;
        registerYoffSet = windowHeight;
        loginWidth = windowWidth;
        _loginOpacity = 1;
//Changing teh height also respectively
        loginHeight = _keyBoardVisible
            ? windowHeight
            : windowHeight - 270; //So, that, dosnt go out of screen

        break;
      case 1:
        //Now, we need to chnage the background color
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;
        //Checking for the keyboard visibility and then setting up the offset for the login container
        loginYoffSet = _keyBoardVisible
            ? 60
            : 270; //keyboard visible-> 20 only, else normal 270

        //Changing teh height also respectively
        loginHeight = _keyBoardVisible
            ? windowHeight
            : windowHeight - 270; //So, that, dosnt go out of screen

        loginWidth = windowWidth;
        loginXoffSet = 0;
        registerYoffSet = windowHeight;
        _loginOpacity = 1;
        break;
      case 2:
        //Now, we also need to chnage the background color again
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;
        loginYoffSet = _keyBoardVisible ? 60 : 240;

        loginXoffSet = 20;
        loginWidth = windowWidth -
            40; //Shifting offset to 20, hence substracting 40 from width
        registerYoffSet = _keyBoardVisible ? 80 : 270;
        _loginOpacity = 0.6;
//Changing teh height also respectively
        loginHeight = _keyBoardVisible
            ? windowHeight
            : windowHeight - 240; //So, that, dosnt go out of screen

        registerHeight = _keyBoardVisible ? windowHeight : windowHeight - 240;

        break;
    }

    return Stack(
      children: [
        AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            //Assinging a color, to the main page container
            color: _backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Container 1, for the heading
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                    });
                  },
                  child: Container(
                    child: Column(
                      children: [
                        AnimatedContainer(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: Duration(milliseconds: 1000),
                            margin: const EdgeInsets.only(top: 100),
                            child: Text(
                              'Explore Events',
                              style: TextStyle(
                                  color: _headingColor,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )),
                        AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 1000),
                          margin: EdgeInsets.only(left: 20, right: 20, top: 6),
                          child: Text(
                            'Lorem de ipsum lorem de ipsum lorem de ipsum lorem de ipsum lorem de ipsum lorem de ipsum lorem de ipsum lorem de ipsum',
                            style:
                                TextStyle(color: _headingColor, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Container 2 for the image
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Center(
                    child: Image.asset('assets/images/events.png'),
                  ),
                ),

                //Conatiner 3 for the button
                Container(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_pageState != 0) {
                        _pageState = 0;
                      } else {
                        _pageState = 1;
                      }
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Color(0xFFB40284A),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                        child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                ))
              ],
            )),
        //Following is the setup for the login page

        AnimatedContainer(
          width: loginWidth,
          height: loginHeight,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(loginXoffSet, loginYoffSet, 0),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(
                  _loginOpacity), //Providing the opacity of the container, which will change according to the cases
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          //Olacing multiple fileds as required on login page
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //The Column for the top items
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Login to your Account',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFB40284A),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InputWithIcon(
                      icon: Icons.email,
                      hint: 'Enter Email....',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputWithIcon(
                      icon: Icons.vpn_key,
                      hint: 'Enter Password....',
                    ),
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFB40284A)),
                          textAlign: TextAlign.end,
                        )),
                  ],
                ),

                //The column for the buttons below
                Column(
                  children: [
                    PrimaryButton(
                      btnText: 'Login',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageState = 2;
                        });
                      },
                      child: OutlinedButton(
                        btnText: 'Create New Account',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //The developer needs to WRITE THE LOGIN ON SKIP CLICKED here
                        //==>
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          'I will do it later',
                          textAlign: TextAlign.end,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        //Following is the setup for the register page

        AnimatedContainer(
          height: registerHeight,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, registerYoffSet, 0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          //Placing the required elements for the sign up page
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Column for top elements
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Create a new Account',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFB40284A),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    InputWithIcon(
                      icon: Icons.email,
                      hint: 'Enter Email....',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputWithIcon(
                      icon: Icons.vpn_key,
                      hint: 'Enter Password....',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputWithIcon(
                      icon: Icons.vpn_key,
                      hint: 'Confirm Password....',
                    ),
                  ],
                ),

                //Column for the butons
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      PrimaryButton(
                        btnText: 'Create Account',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _pageState = 1;
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _pageState = 1;
                            });
                          },
                          child: OutlinedButton(
                            btnText: 'Already have account? Login',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//Creating separate classes for the buttons and the inputs

//The primary button
class PrimaryButton extends StatefulWidget {
  //Following is the dynamic text, we want for our button
  final String btnText;

  PrimaryButton({required this.btnText});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFB40284A),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

//The outlined button
class OutlinedButton extends StatefulWidget {
  //Following is the dynamic text, we want for our button
  final String btnText;

  OutlinedButton({required this.btnText});

  @override
  _OutlinedButtonState createState() => _OutlinedButtonState();
}

class _OutlinedButtonState extends State<OutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFB40284A), width: 1),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
              color: Color(0xFFB40284A),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

//Following will the input Widget we will take in use (Along with a icon displayed)
// ignore: must_be_immutable
class InputWithIcon extends StatefulWidget {
  //Getting the icons and hints to show, with the input widget
  var icon;
  String hint;

  InputWithIcon({
    Key? key,
    required this.icon,
    required this.hint,
  }) : super(key: key);

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFB898989), width: 2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Container(
              width: 60,
              child: Icon(
                widget.icon,
                size: 20,
                color: Color(0xFFB898989),
              )),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: widget.hint,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
