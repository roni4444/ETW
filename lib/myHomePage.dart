import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Flutter"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.bluetooth, size: 35.0),
                        title: Center(
                          child: Text(
                            "ETW STATUS: ",
                            style: TextStyle(fontSize: 35.0),
                          ),
                        ),
                        trailing: Text(
                          "INACTIVE",
                          style: TextStyle(fontSize: 35.0),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Connect"),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.bluetooth, size: 35.0),
                        title: Center(
                          child: Text(
                            "HELMET STATUS: ",
                            style: TextStyle(fontSize: 35.0),
                          ),
                        ),
                        trailing: Text(
                          "INACTIVE",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 35.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  FaIcon(FontAwesomeIcons.motorcycle, size: 35.0),
                  FaIcon(FontAwesomeIcons.helmetSafety, size: 35.0),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        "ETW",
                        style: TextStyle(fontSize: 35.0),
                      ),
                      Row(
                        children: const [
                          Text(
                            "Engine",
                            style: TextStyle(fontSize: 35.0),
                          ),
                          Text(
                            "OFF",
                            style: TextStyle(fontSize: 35.0),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "EPB",
                            style: TextStyle(fontSize: 35.0),
                          ),
                          Text(
                            "ACTIVE",
                            style: TextStyle(fontSize: 35.0),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "Checks",
                            style: TextStyle(fontSize: 35.0),
                          ),
                          Text(
                            "NOT COMPLETE",
                            style: TextStyle(fontSize: 35.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        "HELMET",
                        style: TextStyle(fontSize: 35.0),
                      ),
                      Row(
                        children: const [
                          Text(
                            "Proximity",
                            style: TextStyle(fontSize: 35.0),
                          ),
                          Text(
                            "HEAD DETECTED",
                            style: TextStyle(fontSize: 35.0),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "Orientation",
                            style: TextStyle(fontSize: 35.0),
                          ),
                          Text(
                            "UPRIGHT",
                            style: TextStyle(fontSize: 35.0),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "Connection Strength",
                            style: TextStyle(fontSize: 35.0),
                          ),
                          Text(
                            "OPTIMAL",
                            style: TextStyle(fontSize: 35.0),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
