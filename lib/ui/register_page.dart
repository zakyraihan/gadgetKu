import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetku/data/common/textstyle.dart';
import 'package:gadgetku/widget/textfield_cupertino.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey.shade200,
      child: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(CupertinoIcons.back),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Let's Create An account",
                      style: poppins(22, FontWeight.w500, Colors.black),
                    ),
                    Text(
                      'Create a new account for more explore',
                      style: poppins(14, FontWeight.w500, Colors.grey.shade500),
                    ),
                    const SizedBox(height: 30),
                    CupertinoTextFieldWidget(
                      label: 'Your name',
                      placeHolder: 'Enter your name ',
                    ),
                    const SizedBox(height: 25),
                    CupertinoTextFieldWidget(
                      label: 'Email',
                      placeHolder: 'Enter your email',
                    ),
                    const SizedBox(height: 25),
                    CupertinoTextFieldWidget(
                      label: 'Password',
                      isObsecure: _isObscure,
                      placeHolder: 'Password',
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: _isObscure
                            ? const Icon(CupertinoIcons.eye)
                            : const Icon(CupertinoIcons.eye_slash),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/login-page'),
                            child: Text(
                              'Sign In',
                              style: poppins(13, FontWeight.w500, Colors.blue),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget your password?',
                              style: poppins(
                                  13, FontWeight.normal, Colors.grey.shade700),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: lebar,
                      child: CupertinoButton(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                        child: Text(
                          'Sign Up',
                          style: poppins(16, FontWeight.w500, Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      width: lebar,
                      child: CupertinoButton(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/home/icons8-google-48.png',
                                height: 35),
                            const SizedBox(width: 10),
                            Text(
                              'Sign in with google',
                              style:
                                  poppins(15, FontWeight.normal, Colors.black),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
