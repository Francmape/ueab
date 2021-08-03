import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:ueab/providers/auth_provider.dart';
import 'package:ueab/screens/home/home_screen_base.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;
  bool _passwordVisible = false;
  late String _userName, _password;

  InputDecoration _inputDeco(String label, IconData icon) {
    return InputDecoration(
      hintText: label,
      errorStyle: const TextStyle(height: 0),
      labelStyle: const TextStyle(color: Colors.black),
      prefixIcon: label == 'Phone' ? null : Icon(icon, size: 20),
      suffixIcon: label == 'Password'
          ? IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            )
          : null,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      border: InputBorder.none,
    );
  }

  Future<void> _formSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    // Closing the keyboard
    FocusScope.of(context).unfocus();

    _formKey.currentState!.save();

    try {
      setState(() {
        _isLoading = true;
      });

      // Sign user up
      await Provider.of<AuthProvider>(context, listen: false)
          .login(username: _userName, password: _password);
      Navigator.of(context).pushReplacementNamed(HomeBaseScreen.routeName);
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print(error);
      var message = 'An error occured';
      if (error != null) {
        message = error.toString();
      }

      _showSnackbar(message);
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Theme.of(context).errorColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height * .50,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0))),
            ),
            Column(
              children: [
                const SizedBox(height: 30.0),
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 200.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Login to continue',
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15.0),
                  height: 470,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Row(
                              children: const [
                                Text('School Id Number',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: TextFormField(
                                key: const ValueKey('userName'),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                autocorrect: true,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                enableSuggestions: false,
                                decoration:
                                    _inputDeco('Username', Icons.person),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _userName = newValue!;
                                },
                              ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              children: const [
                                Text('Password',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: TextFormField(
                                key: const ValueKey('password'),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                obscureText: !_passwordVisible,
                                textInputAction: TextInputAction.done,
                                decoration:
                                    _inputDeco('Password', Icons.password),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _password = newValue!;
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Theme.of(context)
                                            .primaryColor, // Decoration color here
                                        width: 1.5, // Underline width
                                      ),
                                    ),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'ForgotPassword?',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print('click');
                                        },
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 50),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  primary: Theme.of(context).primaryColor,
                                ),
                                child: _isLoading
                                    ? const SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: SpinKitPulse(
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                      )
                                    : const Text('LOGIN',
                                        style: TextStyle(color: Colors.white)),
                                onPressed: () => Navigator.of(context)
                                    .pushReplacementNamed(
                                        HomeBaseScreen.routeName),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
