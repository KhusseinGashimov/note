import 'package:flutter/material.dart';
import 'package:note/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon:Icon(Icons.search,color: tdBlack,size: 20,),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 20,
                    minWidth: 25
                  ),
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color:tdGrey)
                ),
              ),
            ),
            ListView()
          ],
        ),
      )
    );
  }
}
