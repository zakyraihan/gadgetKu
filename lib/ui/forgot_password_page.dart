import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gadgetku/data/common/textstyle.dart';
import 'package:gadgetku/widget/textfield_cupertino.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                      'Hi',
                      style: poppins(22, FontWeight.w500, Colors.black),
                    ),
                    Text(
                      'Place enter your email Address To\nReceive a Verification Code',
                      style: poppins(14, FontWeight.w500, Colors.grey.shade500),
                    ),
                    const SizedBox(height: 30),
                    CupertinoTextFieldWidget(
                      label: 'Email',
                      placeHolder: 'Enter your email',
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: lebar,
                      child: CupertinoButton(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                        child: Text(
                          'Continue',
                          style: poppins(16, FontWeight.w500, Colors.white),
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
