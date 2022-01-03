import 'package:flutter/material.dart';
import 'kolokvium.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LAB 03',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'LAB 03'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> listElements = [];
  final courseNameController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  listElements.add({
                    "courseName": courseNameController.text,
                    "date": dateController.text,
                    "time": timeController.text
                  });

                  showDialog(
                      context: context,
                      builder: (context) {
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.of(context).pop(true);
                        });

                        return const AlertDialog(
                            content: Text('Успешно додавање'));
                      });
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: TextField(
                controller: courseNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Име на предмет',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: TextField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Датум | DD/MM/YYYY',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: TextField(
                      controller: timeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Време | HH:MM',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Испити',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                    itemCount: listElements.length,
                    reverse: true,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Kolokvium(
                          listElements[index]['courseName'] as String,
                          listElements[index]['date'] as String,
                          listElements[index]['time'] as String,
                          Theme.of(context).primaryColor);
                    },
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
