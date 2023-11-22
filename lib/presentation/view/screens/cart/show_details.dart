import 'package:flutter/material.dart';

class ShowDetails extends StatelessWidget {
  String? imageUrl ;
  String? name;
  num? price;
  String? weight;
  String? gender;
  ShowDetails({this.imageUrl, this.name,this.weight,this.price,this.gender});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
        title: Text(name.toString(),style: TextStyle(fontSize: 20,color: Colors.black),),
        centerTitle: true,
        actions: [
          IconButton(onPressed:(){}, icon: Icon(Icons.share,color: Colors.black,))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            height: h-150,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(image:NetworkImage(imageUrl.toString()))
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey[200]!,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 22,left: 12,right: 12),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(name!,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                              Text("${price.toString()}\$",style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold),)
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("For ${gender!}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                              Text("${weight.toString()}\$",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                            ],
                          ),

                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                  onPressed:(){

                                  },
                                  child: Text("Add to cart"),
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(2000, 50),
                                      primary: Color(0xFFDB3022),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
