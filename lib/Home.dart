import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'Localaiz.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title".tr()),
        actions: [
          Tooltip(
            message: "ddd",
            child: IconButton(
              icon: const Icon(Icons.language),
              onPressed: () {
                LocalizationCheker.changeLanguage(context);
              },
            ),
          )
        ],
      ),
      body: Column(children: [
        Card(
          child: ListTile(
            title: Text("first".tr()),
            subtitle: Text("second".tr()),
          ),
        )
      ]),
    );
  }
}
