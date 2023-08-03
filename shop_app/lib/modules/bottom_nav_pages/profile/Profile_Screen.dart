import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iti_20233/modules/bottom_nav_pages/profile/About_App.dart';
import 'package:iti_20233/modules/development/Development_team_Screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  TextEditingController ?nameController;
  TextEditingController ?phoneController;
  TextEditingController ?ageController;


  setDataToTextField(data){
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // const Text('Profile',style: TextStyle(
            //   color: Colors.black,
            //   fontSize: 20,
            // ),),
            const SizedBox(height: 30,),
            TextFormField(
              controller: nameController = TextEditingController(text: data['name']),
              decoration: InputDecoration(
                labelText: " Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.white,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            TextFormField(
              controller: phoneController = TextEditingController(text: data['phone']),
              decoration: InputDecoration(
                labelText: " Phone",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.white,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            TextFormField(
              controller: ageController = TextEditingController(text: data['age']),
              decoration: InputDecoration(
                labelText: " Age",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.white,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFF8B40),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                width: 250,
                child: MaterialButton(onPressed: ()=>updateData(), child: Text("Update"))),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Development_team_Screen()),);
              },
              child: const Text(
                'Development Team',style: TextStyle(
                fontSize: 20,
              ),
              ),),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const AboutApp()),);
              },
              child: const Text(
                'About App',style: TextStyle(
                fontSize: 20,
              ),
              ),),
          ],
        ),
      ),
    );
  }

  updateData(){
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.email).update(
        {
          "name":nameController!.text,
          "phone":phoneController!.text,
          "age":ageController!.text,
        }
    ).then((value) => print("Updated Successfully"));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',style: TextStyle(fontSize: 17),),
        centerTitle: true,
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users-form-data").doc(FirebaseAuth.instance.currentUser!.email).snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            var data = snapshot.data;
            if(data==null){
              return const Center(child: CircularProgressIndicator(),);
            }
            return setDataToTextField(data);
          },

        ),
      )),
    );
  }
}