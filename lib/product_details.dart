import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: const[
              Text("Men's ORIGINAL",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),),
              Text("SILK TWILL ROYAL BLUE MEN'S TIE", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),),


            ],
          ),
          Image.asset('images/tie.jpg'),
          const Text(""
              "Color: Blue Royal\n"
              "Dimenstion: Lenght: 148cm\n"
              "Component: 1Tie Printed",
          style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}
