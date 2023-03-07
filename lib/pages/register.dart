import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../component/form_component.dart';
import '../pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email ;
  String? password ;
  var firstnameController =TextEditingController();
  var lastnameController =TextEditingController();
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
                  Text('Regester',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(
                    height: 40,
                  ),

                  defultTextFeild(

                      label: 'First name',
                      type: TextInputType.text,
                      prefix:   Icons.face,
                      controller: firstnameController,
                      validate: (value){
                        if(value.isEmpty){
                          return 'First name must not be empty';
                        }
                        return null;
                      }
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  defultTextFeild(
                      label: 'phone number',
                      type: TextInputType.number,
                      prefix:   Icons.phone,
                      controller: lastnameController,
                      validate: (value){
                        if(value.isEmpty){
                          return 'phone number must not be empty';
                        }
                        return null;
                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defultTextFeild(

                    onchange: (data){
                      email=data;
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
                        password=data;
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
                      text: 'Done',
                      ontap: ()async{
                        if(formKey.currentState!.validate()){
                          try{
                            await registerUser();
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
                ],
              ),
            ),
          ),
        )
    );
  }
  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(email: email!, password: password!);
  }

  void showSnackBar(BuildContext context,String mess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mess)),
    );
  }

}

