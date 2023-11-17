import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 22,top: 22),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("omar osama",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            SizedBox(height: 11,),
            Text("12 kahiry staret kobri elkoba",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
