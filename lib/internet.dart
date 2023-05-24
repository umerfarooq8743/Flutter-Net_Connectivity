import 'dart:async';
// import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class internet extends StatefulWidget {
  const internet({super.key});

  @override
  State<internet> createState() => _internetState();
}

class _internetState extends State<internet> {
  // void checkConn() async {
  //   try {
  //     final result = await InternetAddress.lookup('google.com');
  //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //       print("connected");
  //     }
  //   } on SocketException catch (_) {
  //     print("no conection");
  //   }
  // }

  // void checkConn() async {
  //   var connresult = await (Connectivity().checkConnectivity());
  //   if (connresult == ConnectivityResult.none) {
  //     print("wifi conection");
  //   } else if (connresult == ConnectivityResult.wifi) {
  //     print("no conection");
  //   } else if (connresult == ConnectivityResult.mobile) {
  //     print("mobile conection");
  //   }
  // }

  late StreamSubscription connectivitySubcription;

  late ConnectivityResult oldres;
  @override
  void initState() {
    super.initState();
    connectivitySubcription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult resnow) {
      if (resnow == ConnectivityResult.none) {
        print("no conection???");
      } else if (oldres == ConnectivityResult.none) {
        print(" connected...");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    connectivitySubcription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          "Checking Connection",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 25, color: Colors.amber),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Internet Connect or Not?",
              style: TextStyle(fontSize: 30),
            ),
            BottomAppBar(),
            Container(
              color: Colors.amber,
              child: TextButton(
                  onPressed: () {
                    // checkConn();
                    print("object");
                  },
                  child: Text(
                    "Click",
                    style: TextStyle(backgroundColor: Colors.amber),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
