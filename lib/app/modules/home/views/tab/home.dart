import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiki/app/constant.dart';
import 'package:hiki/app/data/models/futsal.dart';
import 'package:hiki/app/routes/app_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late TextEditingController _controller;

  final List<Futsal> _listFutsal = List.from(listFutsalCourt);

  @override
  void initState() {

    _controller = TextEditingController();

    super.initState();
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(appTitle,style: const TextStyle(fontSize: 32)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            textSearch(),
            listFutsalView(context),
          ],
        ),
      ),
    );
  }

  Widget textSearch() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextField(
          controller: _controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.orange
                  )
              ),
              filled: true,
              fillColor: Colors.white10,
              hintText: searchLabelText,
              hintStyle: TextStyle(color: Colors.orange),
              prefixIcon: const Icon(Icons.search, color: Colors.orange,),
          ),
        ),
    );
  }

  Widget listFutsalView(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: _listFutsal.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DETAIL, arguments: _listFutsal[index]);
              },
              child: ListTile(
                leading: Image.network("https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg", fit: BoxFit.fitHeight,),
                title: Text(_listFutsal[index].title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                subtitle: Text(_listFutsal[index].lat.toString()),
                trailing: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.star, color: Colors.yellow,),
                      ),
                      Text("5", style: TextStyle(color: Colors.yellow),)
                    ],
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}
