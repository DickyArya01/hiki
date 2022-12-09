
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiki/app/data/models/futsal.dart';
import 'package:hiki/app/modules/detail/controller/detail_controller.dart';

class DetailView extends GetView<DetailController> {

  DetailView({Key? key}) : super(key: key);

  Futsal data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        title: const Text("Detail"),
        centerTitle: true,
      ),
      body: _pageView()
    );
  }

  Widget _pageView() {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              _imageHeader(),
              _titleSection(),
              _buttonSection(),
              _textSection(),
            ],
          ),
        ),
      );
  }

  Widget _imageHeader() {
    return Image.network(
      data.imageUrl,
      width: double.maxFinite,
      height: 240,
      fit: BoxFit.cover
    );
  }

  Widget _titleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    data.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
                Text(
                  data.lat.toString(),
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('5'),
        ],
      ),
    );
  }

  Widget _buttonSection() {
    int _idButtonBook = 1;
    int _idButtonShare = 2;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.orange, Icons.book, 'PESAN', _idButtonBook),
          _buildButtonColumn(Colors.orange, Icons.share, 'SHARE', _idButtonShare),
        ],
      ),
    );
  }

  Widget _buildButtonColumn(Color color, IconData icon, String label, int idButton) {
    return InkWell(
      onTap: (){
        switch(idButton){
          case 1:{
            print("Booking lapangan");
          }
            break;
          case 2:{
            print("Share");
          }
            break;
          default:{
            print("Button Function");
          }
          break;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 32,),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _textSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        'lake oeschinen lies at the foot of the blüemlisalp in the bernese '
            'alps. situated 1,578 meters above sea level, it is one of the '
            'larger alpine lakes. a gondola ride from kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees celsius in the summer. activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }





}