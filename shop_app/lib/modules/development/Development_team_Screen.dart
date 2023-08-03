import 'package:flutter/material.dart';

class Development_team_Screen extends StatefulWidget {
  const Development_team_Screen({Key? key}) : super(key: key);

  @override
  State<Development_team_Screen> createState() => _Development_team_ScreenState();
}

class _Development_team_ScreenState extends State<Development_team_Screen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const Text('Development Team',style: TextStyle(fontSize: 17),),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xffFF8B40),
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ),
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Development team :',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color:Color(0xffFF8B40),
              ),
              ),
              SizedBox(height: 15,),
              Text(
                '1.Taher Eladly.',style: TextStyle(
                fontSize: 20,
              ),
              ),
              SizedBox(height: 7,),
              Text(
                '2.Rawan Fathy.',style: TextStyle(
                fontSize: 20,
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
