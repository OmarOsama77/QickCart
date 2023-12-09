import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  String name;
  String address;
  AddressCard(this.name,this.address);

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
            Text(name,style:const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            SizedBox(height: 11,),
            Text(address,style:const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
