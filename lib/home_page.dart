import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isAcive = false;
  var controller = TorchController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Flash Light"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  isAcive
                      ? 'assets/images/flashlight_on.png'
                      : 'assets/images/flashlight_off.png',
                  width: 300,
                  height: 300,
                  color: isAcive ? null : Colors.white24,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const SizedBox(
                  height: 100,
                ),
                CircleAvatar(
                    backgroundColor: Colors.orangeAccent,
                    radius: 35,
                    child: Transform.scale(
                      scale: 1.5,
                      child: IconButton(
                          onPressed: () {
                            controller.toggle();
                            isAcive = !isAcive;
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.power_settings_new,
                            color: Colors.black,
                          )),
                    ))
              ],
            ),
          )),
          IconButton(
            icon: const Icon(
              Icons.person_pin,
              size: 50,
              color: Colors.white,
            ),
            tooltip: 'Github',
            onPressed: () {
              launchUrl(
                Uri.parse('https://github.com/Spyou'),
              );
            },
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
        ]),
      ),
    );
  }
}
