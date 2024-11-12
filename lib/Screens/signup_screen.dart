import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/registration_provider.dart';
import 'login_screen.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
        appBar: AppBar(title:Center(child: Text("Welcome To SignUp Page")),),
      body: Consumer<RegisteProvider>(builder: (context, value, child)
      {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: name,
                  decoration: InputDecoration(
                      hintText: "Name",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: phone,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 20,),
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
                    bool signup = await Provider.of<RegisteProvider>(context,listen: false).signupProvider(name.text, phone.text, email.text, password.text);
                    if(signup)
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      }
                    else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Fill The Data Correctly ")));
                      }
                  },
                  child: Text("SignUp"),
              ),
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
