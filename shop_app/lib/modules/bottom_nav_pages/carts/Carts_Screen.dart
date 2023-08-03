import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_20233/modules/fetchdata/Fetsh_Data_Screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: const Text('Carts',style: TextStyle(fontSize: 17),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: fetchData("users-cart-items"),
      ),
    );
  }
}