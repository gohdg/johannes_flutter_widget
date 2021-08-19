import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_controller.dart';

class TotalPage extends StatelessWidget {
  // const TotalPage({Key? key}) : super(key: key);
  final MyController c = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total items',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() => Text(
                    '${c.sum}',
                    style: TextStyle(fontSize: 40, color: Colors.redAccent),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 180,
                height: 70,
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30),
                //     color: Colors.blue),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () => Get.back(),
                    child: Text(
                      'Go Back',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
