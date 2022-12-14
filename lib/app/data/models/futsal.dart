class Futsal{
  double lat;
  double lon;
  String title;
  String time;
  int court;
  bool isParkingLotExist;
  String imageUrl;
  String desc;

  Futsal({required this.lat, required this.lon, required this.title, required this.time, required this.court, required this.isParkingLotExist, required this.imageUrl, required this.desc});
}

String textDesc =
    'lake oeschinen lies at the foot of the blüemlisalp in the bernese '
    'alps. situated 1,578 meters above sea level, it is one of the '
    'larger alpine lakes. a gondola ride from kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees celsius in the summer. activities '
    'enjoyed here include rowing, and riding the summer toboggan run.';

List<Futsal> listFutsalCourt = [
  Futsal(lat: -7.939889704539739, lon: 112.60540675051458, title: "Caesar Futsal", time: "07.00 - 22.00", court: 3, isParkingLotExist: true, imageUrl: "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg", desc: textDesc),
  Futsal(lat: -7.927232695284277, lon: 112.60447546317106, title: "Champions Futsal Tlogomas ", time: "08.00 - 22.00", court: 5, isParkingLotExist: true, imageUrl: "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg", desc: textDesc),
  Futsal(lat: -7.93589388773497, lon: 112.60048884063167, title: "Buana Futsal", time: "09.00 - 21.00", court: 3, isParkingLotExist: true, imageUrl: "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg", desc: textDesc),
  Futsal(lat: -7.945319095666317, lon: 112.61746413660579, title: "Viva Futsal", time: "06.00 - 02.00", court: 3, isParkingLotExist: true, imageUrl: "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg", desc: textDesc),
];

class FutsalApi{
  int id;
  String title;
  String nohp;
  String alamat;
  String wilayah;
  String lat;
  String lon;
  String jenislapangan;
  String jumlahlapangan;
  String fasilitas;
  String harga;
  String buka;
  String imageUrl;
  String typeBooking;

  FutsalApi({
    required this.id,
    required this.title,
    required this.nohp,
    required this.alamat,
    required this.wilayah,
    required this.lat,
    required this.lon,
    required this.jenislapangan,
    required this.jumlahlapangan,
    required this.fasilitas,
    required this.harga,
    required this.buka,
    required this.imageUrl,
    required this.typeBooking});

  factory FutsalApi.fromJson(Map<String, dynamic> json){
    return FutsalApi(
        id: json[0],
        title: json[1],
        nohp: json[2],
        alamat: json[3],
        wilayah: json[4],
        lat: json[5],
        lon: json[6],
        jenislapangan: json[7],
        jumlahlapangan: json[8],
        fasilitas: json[9],
        harga: json[10],
        buka: json[11],
        imageUrl: json[12],
        typeBooking: json[13]);
  }

}

class User{
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User({required this.id, required this.email, required this.firstName, required this.lastName, required this.avatar});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"]);
  }

}
