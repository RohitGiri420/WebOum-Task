import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weboum/Cubit/UserCubit.dart';
import 'package:weboum/Model/UserModel.dart';
import 'package:weboum/Screens/LoginScreen.dart';

import '../Widget/UIHelper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController SignUpUserName = TextEditingController();
  TextEditingController SignUpPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SignUp",style: TextStyle(fontSize: 35),),
            SizedBox(height: 20,),
            UiHelper().CustomTextField(SignUpUserName, Text("Username")),
            SizedBox(height: 20,),
            UiHelper().CustomTextField(SignUpPass, Text("Password")),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              String  userName = SignUpUserName.text;
              String  Password = SignUpPass.text;
              context.read<Usercubit>().AddData(UserModle(Username: userName, Password: Password));
              Navigator.pop(context);
            }, child: Text("SignUp")),
            SizedBox(height: 20,),

            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
            }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
