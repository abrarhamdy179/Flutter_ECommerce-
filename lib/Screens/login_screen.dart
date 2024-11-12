import 'package:e_commerce/Screens/products_screen.dart';
import 'package:e_commerce/Screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/registration_provider.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(title:Center(child: Text("Welcome To Login Page")),),
      body: Consumer<RegisteProvider>(builder: (context, value, child)
      {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 50,),
              OutlinedButton(
                onPressed: () async {
                  bool login = await Provider.of<RegisteProvider>(context,listen: false).loginProvider(email.text, password.text);
                  if(login)
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsScreen()));
                  }
                  else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Fill The Dta Correctly ")));
                  }
                },
                child: Text("Login"),
              ),
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
              },
                child: Text("Already Have An Account"),
              ),
            ],
          ),
        );
      },),
    );
  }
}
