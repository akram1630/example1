import 'package:flutter/material.dart';

import 'components.dart';
//i'm ramy
/* why do we use REUSABALE COMPONENTS
  1)---->Timing
  2)---->refactor
  3)---->quality
*/
class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreen();   // like recursivite
}
class _LoginScreen extends State<LoginScreen> {
  @override
  void initState() { // when it called in onPressed it rebuilds the scaffold
    super.initState();
  }
  var emailController    = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true ;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(  // bach keyboard mayatla3ch 3la forms
            child: Form(
              key: formKey, // like unique ID
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center, // it doesnt work cuz scroll
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LOGIN',
                    style: TextStyle(
                        fontSize: 40 ,
                        fontWeight: FontWeight.bold
                    ),
                  ) ,
                  SizedBox(height: 20,),
                  defaultFormField(
                      onChange: (v){},
                      onTap: (){},
                      suffix: Icons.access_alarms_outlined,
                      controller: emailController, //pass by address
                      suffixPressed: (){},
                      type: TextInputType.emailAddress,
                      validate: ( String ? valeur){
                        if(valeur!.isEmpty || valeur == null)
                          return 'password must not be empty';
                        return null;
                      },
                      isPassword: true,
                      label: "email",
                      prefix: Icons.email
                  ),
                  SizedBox(height: 13,) ,
                  defaultFormField(

                      suffixPressed: (){
                        setState(() {
                          isPassword = !isPassword  ; // setState inside function
                        });
                      },
                      controller: passwordController, //pass by address
                      type: TextInputType.visiblePassword,
                      validate: ( valeur){
                        if(valeur!.isEmpty || valeur == null)
                          return 'password must not be empty';
                        //throw("sffs<");
                        return null;
                      },
                      suffix: isPassword ? Icons.visibility :Icons.visibility_off ,
                      label: 'password',
                      prefix: Icons.lock,
                      isPassword: isPassword
                  ),
                  SizedBox(height: 20,) ,
                  defaultButton(
                    radiusBorder: 15,
                      width: double.infinity,
                      color: Colors.green,
                      function: (){
                        if(formKey.currentState!.validate()) {
                          print('email = ${emailController.text} ');
                          print('password = ${passwordController.text}');
                          print("hoooola");
                        }
                      },
                      isUppercase: false,
                      text: "hola homies"
                  ),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("Don\'t u have an account !") ,
                      SizedBox(width: 50,) ,
                      Expanded(
                        child: TextButton(
                            onPressed: (){},
                            child:
                            Text('Register now ',
                              style: TextStyle( color: Colors.blue,
                                  fontSize: 15
                              ),
                            )
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}