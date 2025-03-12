import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List products = [
    "Heels", "Clogs", "Sneakers", "Crocs", "Flip Flops", "Sandals", "Open-toed shoes", "Stilettos","Tie","Belt"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final item = products[index];
        return Card(
          elevation: 5,
          color:Colors.white70,
          margin: EdgeInsets.all(4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0)
          ),
          child: Dismissible(
            key: Key(item),
            onDismissed: (direction){
              setState(() {
                products.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$item deleted')));
            },
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: const Icon(Icons.delete, color: Colors.white,),
            ),
            child: ListTile(
              title: Text(item, style: TextStyle(fontWeight: FontWeight.w600)),
              trailing: const Icon(Icons.arrow_back),
            ),

          ),

        );
      },
    );
  }
}
