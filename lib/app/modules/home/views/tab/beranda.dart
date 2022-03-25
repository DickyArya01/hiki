import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiki/app/modules/home/controllers/tab_beranda_controller.dart';

class BerandaTab extends GetView<TabBerandaController> {
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
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formSearch(context),
              _cardFutsalRoom(),
              const SizedBox(
                height: 20,
              ),
              const Text('Look an Online People',
                  style: TextStyle(color: Colors.white)),
              const SizedBox(
                height: 20,
              ),
              _lookPeople(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardFutsalRoom() {
    // Scroll Room
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
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
                        Container(
                          height: 200,
                          child: Stack(
                            children: [
                              const Image(
                                height: 200,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1630420598913-44208d36f9af?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1325&q=80'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('23 Mar 2022 \n Rabu',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        TextButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white38)),
                                            onPressed: () {},
                                            child: const Text(
                                              '14.00',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
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
    );
  }

  Widget _lookPeople() {
    // List People
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Fahri Koiron",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text('Malang Indonesia',
                              style: TextStyle(
                                color: Colors.white,
                              )),
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _formSearch(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyText1,
      controller: controller.textController['search'],
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(14),
        label: const Text("Search"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(),
        ),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
