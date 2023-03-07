import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taska/pages/register.dart';
import '../component/form_component.dart';
import 'home.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password ;

  var formKey= GlobalKey<FormState>();
  bool ispassword =true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key:formKey ,
            child: Column(
              children: [
                Text('Login',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),),
                SizedBox(
                  height: 40,
                ),
                defultTextFeild(
                  onchange: (data) {
                    email = data;
                  },
                    label: 'email adress',
                    type: TextInputType.emailAddress,
                    prefix:  Icons.email,
                    validate: (value){
                      if(value.isEmpty){
                        return 'email must not be empty';
                      }
                      return null;
                    }
                ),
                SizedBox(
                  height: 20,
                ),
                defultTextFeild(
                  onchange: (data){
                    password = data ;
                  },
                    label: 'Password',
                    type: TextInputType.visiblePassword,
                    prefix:  Icons.lock,
                    suffix: ispassword ? Icons.remove_red_eye :Icons.visibility_off ,

                    isPasswordd: ispassword,
                    validate: (value){
                      if(value.isEmpty){
                        return 'Password must not be empty';
                      }
                      return null;
                    },
                    suffixPressed: (){
                      setState(() {
                        ispassword = !ispassword;
                      });
                    }
                ),
                SizedBox(
                  height: 20,
                ),
                defultButton(
                    text: 'login',
                    ontap: () async{
                      if(formKey.currentState!.validate()){

                        try{
                          await loginUser();
                          showSnackBar(context, 'success');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password')
                          {
                            showSnackBar(context, 'weak password');
                            print('weak password');
                          } else if (ex.code == 'email-already-in-use') {
                            showSnackBar(context, 'email already in use');
                            print('email already in use');
                          }
                        }
                        catch (ex) {
                          showSnackBar(context, 'there was an error');
                        }
                      }
                    }
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('don\' have an acount'),
                    TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );

                      }, child: Text('register now',
                      style: TextStyle(
                          color: Colors.deepOrange
                      ),))
                  ],
                )
              ],

            ),

          ),

        ),
      ),
    );
  }

  void showSnackBar(BuildContext context,String mess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mess)),
    );
  }

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth
        .signInWithEmailAndPassword(email: email!, password: password!);
  }

}
