import 'package:flutter/material.dart';

class HivePreference extends StatefulWidget {
  static String id ="hive_preference";
  const HivePreference({Key? key}) : super(key: key);

  @override
  _HivePreferenceState createState() => _HivePreferenceState();
}

class _HivePreferenceState extends State<HivePreference> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  // void _doLogin() async{
  //   String name = nameController.text;
  //   String email = emailController.text;
  //   String phone = phoneController.text;
  //   String password = passwordController.text;
  //   String confirmpassword = confirmpasswordController.text;
  //
  //   AccountUser user = AccountUser(name: name,email: email,phone: phone,password: password,confirmpassword: confirmpassword);
  //   Preference.storeAccountUser(user);
  //   AccountUser? data = await Preference.loadAccountUser();
  //   print(data!.name);
  // }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.indigo.shade900,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.teal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Text("Welcome",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white.withOpacity(0.5))),
                Text("Sign In",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(35),),
              ),
              padding: EdgeInsets.only(left: 30,right: 30),
              height: MediaQuery.of(context).size.height*0.70,
              width: MediaQuery.of(context).size.width,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 30,),

                  /// #Name
                  Text("Email",style: TextStyle(fontSize: 19),),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      //border: InputBorder.none,
                      //prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,),
                      hintText: "Urmail@gmail.com",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10,),
                  /// #Password
                  Text("Number",style: TextStyle(fontSize: 19),),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      //border: InputBorder.none,
                      //prefixIcon: Icon(Icons.lock_open,color: Colors.grey,),
                      hintText: "000-756-5475",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10,),
                  /// #Address
                  Text("Address",style: TextStyle(fontSize: 19),),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      //border: InputBorder.none,
                      //prefixIcon: Icon(Icons.lock_open,color: Colors.grey,),
                      hintText: "Golden tower,Sylhet",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 20,),
                  /// #Button
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 17),)),
                  ),
                  SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container( color: Colors.grey,
                        height: 1,width: MediaQuery.of(context).size.width*0.35,
                      ),
                      Text("OR",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),
                      Container( color: Colors.grey,
                        height: 1,width: MediaQuery.of(context).size.width*0.35,
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/images/facebook.png",height:20,width: 20,fit: BoxFit.cover,),
                      Image.asset("assets/images/twitter.png",height:20,width: 20,fit: BoxFit.cover,),
                      Image.asset("assets/images/instagram.png",height:15,width: 15,fit: BoxFit.cover,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

