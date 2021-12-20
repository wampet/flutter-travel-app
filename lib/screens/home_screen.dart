// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //we add a state variable called selected state
  int _selectedIndex =0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];
//This is a function called build icon that takes in index and returns a widget
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
        _selectedIndex = index;
        });
        print(_selectedIndex);
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: _selectedIndex == index ?Theme.of(context).colorScheme.secondary: Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30),
        ),
        //Now we add a child to it, we pass in the index so that we can access any icon that we want
        child: Icon(_icons[index],
        //selected index is equal to the primary color otherwise we want to use the given color
            size: 25.0, color:_selectedIndex == index? Theme.of(context).primaryColor:Color(0xFFB4C1C4),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 120),
              child: Text(
                'What would you like to find?',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
          ],
        ),  
      ),
    );
  }
}
