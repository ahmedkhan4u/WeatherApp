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
        title: Text("Weather"),
        centerTitle: true,
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
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                controller.list[0].location.country,
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 170, 170, 170)),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${controller.list[0].location.region}, ',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 170, 170, 170)),
                  ),
                  Text(
                    controller.list[0].location.name,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 170, 170, 170)),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.list[0].current.condition.text,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Image.network(
                      "https:${controller.list[0].current.condition.icon}"),
                ],
              ),
              SleekCircularSlider(
                initialValue: controller.list[0].current.tempC,
                appearance: CircularSliderAppearance(
                    animationEnabled: true,
                    infoProperties: InfoProperties(
                        mainLabelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.orange),
                        modifier: percentageModifier),
                    size: 100,
                    customColors: CustomSliderColors(
                      progressBarColor: Colors.white,
                      trackColor: Colors.blueAccent,
                      dotColor: Colors.black,
                    )),
              ),
              Container(
                height: 0.5,
                color: Color.fromARGB(255, 155, 155, 155),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SleekCircularSlider(
                    initialValue:
                        controller.list[0].current.humidity.toDouble(),
                    appearance: CircularSliderAppearance(
                        animationEnabled: true,
                        infoProperties: InfoProperties(
                            topLabelStyle: TextStyle(fontSize: 12),
                            topLabelText: "Humidity",
                            mainLabelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                            modifier: percentageModifierHumidity),
                        size: 100,
                        customColors: CustomSliderColors(
                          progressBarColor: Colors.white,
                          trackColor: Colors.blueAccent,
                          //dotColor: Colors.black,
                        )),
                  ),
                  SleekCircularSlider(
                    initialValue: controller.list[0].current.cloud.toDouble(),
                    appearance: CircularSliderAppearance(
                        animationEnabled: true,
                        infoProperties: InfoProperties(
                            topLabelStyle: TextStyle(fontSize: 12),
                            topLabelText: "Cloud",
                            mainLabelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                            modifier: percentageModifierHumidity),
                        size: 100,
                        customColors: CustomSliderColors(
                          progressBarColor: Colors.white,
                          trackColor: Colors.blueAccent,
                          //dotColor: Colors.black,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Feels Like ${controller.list[0].current.feelslikeC} \u2103 \n\nFeels Like ${controller.list[0].current.feelslikeF} \u2109',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 206, 206, 206)),
                  ),
                  Text(
                    'Wind ${controller.list[0].current.windKph}/hr \n\nDirection < ${controller.list[0].current.windDir}',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 206, 206, 206)),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  String percentageModifier(double value) {
    final roundedValue = value.ceil().toInt().toString();
    return '$roundedValue \u2103';
  }

  String percentageModifierHumidity(double value) {
    final roundedValue = value.ceil().toInt().toString();
    return '$roundedValue %';
  }
}
