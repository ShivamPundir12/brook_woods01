import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  Future PasswordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Password Reset link has been sent to your email.'
                  ' Check your email to Change your Password '),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.blueGrey.shade300,
        content: Text(
          e.toString(),
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  final emailcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      print('Ok');
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/fur1.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
          child: Column(
            children: [
              Text(
                'Enter your Email',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Satisfy'),
              ),
              SizedBox(
                height: 25,
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      // top: MediaQuery.of(context).size.height * 0.2,
                      right: 30,
                      left: 30),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formkey,
                    child: TextFormField(
                      cursorColor: Colors.grey.shade200,
                      controller: emailcontroller,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(25)),
                          labelStyle: TextStyle(
                              color: Colors.grey.shade200,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                          hintText: "Enter Email",
                          labelText: "Email",
                          fillColor: Colors.white38,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          suffixIcon: Icon(
                            CupertinoIcons.mail_solid,
                            color: Colors.grey.shade200,
                          )),
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'should not be Empty'),
                        EmailValidator(errorText: 'Enter a Valid Email')
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.grey.shade300,
                      backgroundColor: Colors.black,
                      shadowColor: Colors.grey.shade600,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minimumSize: Size(102, 50),
                    ),
                    onPressed: PasswordReset,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Reset \nPassword',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
