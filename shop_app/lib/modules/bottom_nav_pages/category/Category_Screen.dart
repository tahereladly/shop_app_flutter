import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_20233/modules/product_details/produc_details_screen.dart';
import 'package:iti_20233/modules/search/searchscreen.dart';

class CategoryScreen extends StatefulWidget {

  @override
  State<CategoryScreen> createState() => _HomeBarState();
}

class _HomeBarState extends State<CategoryScreen> {

  var _firestoreInstance=FirebaseFirestore.instance;
  List _products=[];
  fetchCategory()async{
    QuerySnapshot qn=await _firestoreInstance.collection("category").get();
    setState(() {
      for(int i =0;i<qn.docs.length;i++){
        _products.add(
            {
              "product-name": qn.docs[i]["product-name"],
              "product-image": qn.docs[i]["product-image"],



            }
        );
      }
    });
    return qn.docs;
  }

  @override
  void initState() {
    fetchCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Category',style: TextStyle(fontSize: 17),),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
              children: [
                // const Text(
                //     'Category',style: TextStyle(fontSize: 17),
                // ),
                const SizedBox(height: 35,),
                Expanded(
                    child: GridView.builder(

                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: _products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1),
                        itemBuilder:(_,index)
                        {return GestureDetector(
                          onTap: (){},
                          child: Card(
                            elevation: 3,
                            child: Column(
                              children: [
                                AspectRatio(
                                    aspectRatio:2,
                                    child: Container(
                                        color: Colors.white,
                                        child:
                                        Image.network(_products[index]["product-image"][0],))),
                                const SizedBox(height: 7,),
                                Text("${_products[index]["product-name"]}"),


                              ],
                            ),

                          ),
                        );

                        }
                    )
                ),
              ],))
    );
  }
}
