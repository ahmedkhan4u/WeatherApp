import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/controllers/home_controller.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Obx(() {
          if (controller.isLoading == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.isLoading == false &&
              controller.list.length == 0) {
            return Center(
              child: Text("Some thing went wrong retry"),
            );
          }

          return Column(
            children: [
              Image.network(
                  "https:${controller.list[0].current.condition.icon}"),
              SleekCircularSlider(
                initialValue: 0,
                appearance: CircularSliderAppearance(
                    size: 100,
                    customColors: CustomSliderColors(
                      progressBarColor: Colors.white,
                      trackColor: Colors.amber,
                      dotColor: Colors.black,
                    )),
              ),
            ],
          );
        }),
      ),
    );
  }
}
