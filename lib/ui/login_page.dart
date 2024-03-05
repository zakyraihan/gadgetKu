import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetku/common/textstyle.dart';
import 'package:gadgetku/widget/textfield_cupertino.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      'Welcome Back',
                      style: poppins(22, FontWeight.w500, Colors.black),
                    ),
                    Text(
                      'Put your password to explore again',
                      style: poppins(14, FontWeight.w500, Colors.grey.shade500),
                    ),
                    const SizedBox(height: 30),
                    CupertinoTextFieldWidget(
                      label: 'Email',
                      placeHolder: 'Enter your email',
                    ),
                    const SizedBox(height: 25),
                    CupertinoTextFieldWidget(
                      label: 'Password',
                      isObsecure: true,
                      placeHolder: 'Password',
                      suffix: IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.eye),
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
                                Navigator.pushNamed(context, '/register-page'),
                            child: Text(
                              'Sign Up For Free',
                              style:
                                  poppins(13, FontWeight.normal, Colors.blue),
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
                          'Sign In',
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
