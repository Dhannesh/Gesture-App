import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SimpleGesture extends StatelessWidget {
  const SimpleGesture({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta Store',
      theme: ThemeData(
          brightness: Brightness.light, primarySwatch: Colors.blueGrey),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Insta Store'),
          ),
          body: CustomerSubscription()),
    );
  }
}

class CustomerSubscription extends StatefulWidget {
  const CustomerSubscription({super.key});

  @override
  State<CustomerSubscription> createState() => _CustomerSubscriptionState();
}

class _CustomerSubscriptionState extends State<CustomerSubscription> {
  final List<String> names = <String>['Alice', 'Bob', 'James'];
  bool makeTextBlue = false;
  TextEditingController nameController = TextEditingController();

  void addNameToList() {
    if (nameController.text.isNotEmpty) {
      setState(() {
        names.insert(0, nameController.text);
        nameController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
                suffixIcon: InkResponse(
                  onLongPress: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Double tap to subscribe")));
                  },
                  onDoubleTap: addNameToList,
                  highlightColor: Colors.orangeAccent,
                  highlightShape: BoxShape.circle,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: Icon(Icons.add),
                  ),
                ),
                border: OutlineInputBorder(),
                labelText: 'Add your name to subscribe'),
          ),
        ),
        Expanded(
            child: ListView.builder(
          padding: EdgeInsets.all(2),
          itemCount: names.length,
          itemBuilder: (context, int index) {
            return Card(
                color: Colors.blueGrey[200],
                elevation: 5,
                margin: EdgeInsets.all(4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                child: ListTile(
                  leading: Icon(Icons.check),
                  title: Text(
                    '${names[index]} subscribed!',
                    style: TextStyle(
                        fontSize: 18,
                        color: makeTextBlue ? Colors.blue : Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ));
          },
        ))
      ],
    );
  }
}
