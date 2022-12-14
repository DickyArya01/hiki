
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiki/app/constant.dart';
import 'package:hiki/app/data/models/Service.dart';
import 'package:hiki/app/data/models/futsal.dart';
import 'package:hiki/app/routes/app_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late TextEditingController _controller;

  late List<Futsal> _listFutsal = List.from(listFutsalCourt);

  // List<FutsalApi> listfutsalapi = [];

  // List<User> listUser = [];

  Service serviceApi = Service();

  // List<FutsalApi> listFutsal = [];
  // late Future<List<User>> listUser;

  @override
  void initState() {
    _controller = TextEditingController();
    _listFutsal = listFutsalCourt;
    // listFutsal = lisFutsalApi;
    // listUser = serviceApi.getData();
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
          onChanged: (value) => updateList(value),
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
              hintStyle: const TextStyle(color: Colors.orange),
              prefixIcon: const Icon(Icons.search, color: Colors.orange,),
          ),
        ),
    );
  }

  Widget listFutsalView(BuildContext context) {
    return Expanded(
        // child: FutureBuilder<List<FutsalApi>>(
      child: ListView.builder(
          itemCount: _listFutsal.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DETAIL, arguments: _listFutsal[index]);
              },
              child: ListTile(
                leading: Image.network(_listFutsal[index].imageUrl, fit: BoxFit.cover, width: 100,),
                title: Flexible(child: Text(_listFutsal[index].title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,)),
                subtitle: Text(_listFutsal[index].wilayah),
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
      )
    );
  }

  void updateList(String value) {
    setState(() {
      _listFutsal = listFutsalCourt.where((element) => element.title!.toLowerCase().contains(value.toLowerCase())).toList();
    },);
  }
}
