import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weboum/Cubit/UserCubit.dart';
import 'package:weboum/Cubit/UserState.dart';
import 'package:weboum/Database/DbHelper.dart';
import 'package:weboum/Screens/SignUpScreen.dart';
import 'package:weboum/Widget/UIHelper.dart';

import '../Model/UserModel.dart';
import 'HomePage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<Usercubit>().GetData();
  }

  @override


  TextEditingController UserNameController = TextEditingController();
  TextEditingController PassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: BlocBuilder<Usercubit,UserState>(
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login",style: TextStyle(fontSize: 35),),
              SizedBox(height: 20,),
              UiHelper().CustomTextField(UserNameController, Text("Username")),
              SizedBox(height: 20,),
              UiHelper().CustomTextField(PassController, Text("Password")),
              SizedBox(height: 20,),

              ElevatedButton(onPressed: (){

                String UserName = UserNameController.text;
                String Password = PassController.text;
                if(state is LoadedState){
                  for(int i = 1; i<= state.arrlist.length;i++){
                    if(UserName == state.arrlist[i].Username && Password == state.arrlist[i].Password){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                    }
                  }

                }



                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(

                    content: Row(
                      children: [
                        Icon(Icons.error_outline,color: Colors.white,),
                        SizedBox(width: 30,),
                        Text("Invalid User",),
                      ],
                    ),
                    backgroundColor: Colors.black12,
                    action: SnackBarAction(label: "Ok", onPressed: (){
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    }),
                  ));




              }, child: Text("Login")),
              SizedBox(height: 20,),

              TextButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpScreen(),));
              }, child: Text("SignUp"))
            ],
          ),
        ),
      ),
    );
  }
}
