import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiki/app/global/constants/images.dart';
import 'package:hiki/app/global/controller/app_controller.dart';
import 'package:hiki/app/global/theme/colors.dart';
import 'package:hiki/app/modules/home/controllers/home_controller.dart';

class BerandaTab extends GetView<HomeController> {
  const BerandaTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HIKI'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Scroll Room
            SizedBox(
              height: 350,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white60,
                      child: SizedBox(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Image(
                                height: 200,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1630420598913-44208d36f9af?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1325&q=80'),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                'Room 21 - Savana',
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  width: double.infinity,
                                  height: 33,
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue)),
                                    onPressed: () {},
                                    child: const Text("Detail",
                                        style: TextStyle(color: Colors.white)),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 33,
                                child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.blue)),
                                  onPressed: () {},
                                  child: const Text("Add to Favorite",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            // Look an Online People
            const Text('Look an Online People',
                style: TextStyle(color: Colors.white)),
            const SizedBox(
              height: 20,
            ),
            // List People
            SizedBox(
              height: 200,
              // color: Colors.white,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white60,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://images.unsplash.com/photo-1593726891090-b4c6bc09c819?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                                    ),
                                  )),
                            ),
                            Flexible(
                              flex: 3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text("Fahri Koiron",
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                      Text('Malang Indonesia',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.message,
                                  ),
                                  Text(
                                    'Chat Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
