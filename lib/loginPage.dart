import 'package:flutter/material.dart';
import 'package:login/Homepage.dart';
import 'package:login/loginPage.dart';
import 'main.dart';

class Loginpage extends StatelessWidget {
   Loginpage({super.key});
   final _formkey=GlobalKey<FormState>();
   final TextEditingController _usernameController=TextEditingController();
   final TextEditingController _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
      //  title: Text("Welcome Back"),

      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: image,
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding:EdgeInsets.all(20.0),
                child: Card(
                  elevation: 9,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19.0),
                  ),
                  color: Colors.white.withOpacity(0.9),  
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: NetworkImage("https://thumbs.dreamstime.com/z/x-green-alphabet-letter-icon-logo-creative-design-business-company-240442313.jpg?ct=jpeg"),
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(width: 10),
                            Text.rich(
                              TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: "Xpert",
                                  style:TextStyle(
                                    fontSize: 27.0,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(255, 8, 124, 178)
                                  ),
                                ),
                                TextSpan(
                                  text: "Capture",
                                  style: TextStyle(
                                    fontSize: 27.0,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(255, 3, 173, 91)
                                  ),
                                )
                              ])
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller:_usernameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(19),
                              
                            ),
                            labelText: "Username",
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if(value ==null || value.isEmpty)
                            {
                              return "Please enter your name";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(19),
                            ),
                          ),
                          validator: (value) {
                            if(value ==null || value.isEmpty)
                            {
                              return "Please Enter your password";
                            }
                            else if(value.length<6)
                            {
                              return "Password must be more than 6 characters";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (){
                              if(_formkey.currentState!.validate()){
                                String username= _usernameController.text.trim();
                                String password = _passwordController.text.trim();
                                if(username == "admin" && password=="123456"){
                                  Navigator.push(
                                    context, MaterialPageRoute(builder: (context)=>Homepage(),
                                    ),
                                    );
                                    
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Invalid username or password"),
                                    backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                }
                              }
                              

                            }, 
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(fontSize: 16),
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19),
                              ),
                            ),
                            child: Text("Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              //backgroundColor: const Color.fromARGB(255, 170, 202, 216),
                              
                            ),
                            ),
                          ),
                        )
                        

                      ],
                    ),
                    ),
                    ), 
                    
                ),
                
                ),  
                
            ),

          ),
        ],
      ),
    );
  }
}