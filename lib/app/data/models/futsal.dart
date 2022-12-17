class Futsal{
  double lat;
  double lon;
  String title;
  String time;
  String wilayah;
  int court;
  bool isParkingLotExist;
  String imageUrl;
  String desc;

  Futsal({required this.lat, required this.lon, required this.title, required this.time, required this.wilayah ,required this.court, required this.isParkingLotExist, required this.imageUrl, required this.desc});
}

String textDesc =
    'lake oeschinen lies at the foot of the blüemlisalp in the bernese '
    'alps. situated 1,578 meters above sea level, it is one of the '
    'larger alpine lakes. a gondola ride from kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees celsius in the summer. activities '
    'enjoyed here include rowing, and riding the summer toboggan run.';

List<Futsal> listFutsalCourt = [
  Futsal(lat: -7.939889704539739, lon: 112.60540675051458, title: "Caesar Futsal", time: "07.00 - 22.00", wilayah: "Merjosari",court: 3, isParkingLotExist: true, imageUrl: "https://lh5.googleusercontent.com/p/AF1QipMU-_t8y5PQwP9lRbE_UpKB6AgywXpIrnX5l_RQ=w426-h240-k-no", desc: textDesc),
  Futsal(lat: -7.927232695284277, lon: 112.60447546317106, title: "Champions Futsal Tlogomas ", time: "08.00 - 22.00", wilayah: "Tlogomas", court: 5, isParkingLotExist: true, imageUrl: "https://lh5.googleusercontent.com/p/AF1QipNcI3zTLxvqnTK3hdvf3EOzZSk081nZ-iyr5BQZ=w408-h544-k-no", desc: textDesc),
  Futsal(lat: -7.93589388773497, lon: 112.60048884063167, title: "Olympico Futsal Arena", time: "09.00 - 21.00", wilayah: "Sumbersari", court: 3, isParkingLotExist: true, imageUrl: "https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=5KwEtFfkeoGNisWquTlVbQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=353.9645&pitch=0&thumbfov=100", desc: textDesc),
  Futsal(lat: -7.945319095666317, lon: 112.61746413660579, title: "Viva Futsal", time: "06.00 - 02.00", wilayah: "Jatimulyo", court: 3, isParkingLotExist: true, imageUrl: "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg", desc: textDesc),
  Futsal(
      lat: -7.940645125131871,
      lon: 112.62542019992617,
      title: "Angkasa Futsal Malang",
      time: "08:00 - 22:00",
      wilayah: "Tulusrejo",
      court: 1,
      isParkingLotExist: true,
      imageUrl:
      "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg",
      desc: textDesc),
  Futsal(
      lat: -7.935629639188273,
      lon: 112.6244760623559,
      title: "Futsal Nikimirah",
      time: "24 Jam",
      wilayah: "Mojolangu",
      court: 1,
      isParkingLotExist: true,
      imageUrl:
      "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg",
      desc: textDesc),
  Futsal(
      lat: -7.948635773016473,
      lon: 112.6223945616565,
      title: "The Scorpion Futsal",
      time: "24 Jam",
      wilayah: "Jatimulyo",
      court: 1,
      isParkingLotExist: true,
      imageUrl:
      "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg",
      desc: textDesc),
  Futsal(
      lat: -7.935544630470875,
      lon: 112.63423919665954,
      title: "Wiga Futsal",
      time: "06.00 - 02.00",
      wilayah: "Mojolangu",
      court: 2,
      isParkingLotExist: true,
      imageUrl:
      "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg",
      desc: textDesc),
  Futsal(
      lat: -7.940517538824484,
      lon: 112.63702777356515,
      title: "ABM Futsal",
      time: "07:00 - 22:00",
      wilayah: "Mojolangu",
      court: 1,
      isParkingLotExist: true,
      imageUrl:
      "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg",
      desc: textDesc),
  Futsal(
      lat: -7.94408261041232,
      lon: 112.64353364258746,
      title: "Wijaya Putra Futsal",
      time: "10:00 - 22:00",
      wilayah: "Blimbing",
      court: 3,
      isParkingLotExist: true,
      imageUrl:
      "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg",
      desc:textDesc),
  Futsal(
      lat: -7.993176528925621,
      lon: 112.62091694332511,
      title: "Bima Sakti Futsal",
      time: "07.00 - 02.00",
      wilayah: "Sukun",
      court: 1,
      isParkingLotExist: true,
      imageUrl:
      "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg",
      desc: textDesc),
  Futsal(lat: -7.932197814653308, lon: 112.63001005488609, title: "Zona SM Futsal", time: "24 Jam", wilayah: "Mojolangu", court: 10, isParkingLotExist: true, imageUrl: "https://lh5.googleusercontent.com/p/AF1QipOmjzQgO2dBvOdM3prqUt5eaCtkyZyShJzlIbUx=w408-h306-k-no", desc: textDesc),
  Futsal(lat: -7.955080244829175, lon: 112.6047852076709, title: "Ongisnade Futsal", time: "07.00 - 22.00", wilayah: "Karangbesuki", court: 2, isParkingLotExist: true, imageUrl: "https://lh5.googleusercontent.com/p/AF1QipM1tRd9Owl9PKEgA4CQp-l7NPQ_axcCXoytV-G-=w408-h544-k-no", desc: textDesc),
  Futsal(lat: -7.936607238703678, lon: 112.60061689712619, title: "Buana Futsal", time: "09.00 - 21.00", wilayah: "Merjosari", court: 2, isParkingLotExist: true, imageUrl: "https://lh5.googleusercontent.com/p/AF1QipN5bpbUUA-zUvPo8lYNxAqJxIQOKFdXqzriDYTL=w426-h240-k-no", desc: textDesc),
  Futsal(
      lat: -7.97485941913458,
      lon: 112.65324659573139,
      title: "Biru Futsal",
      time: "06.00 - 02.00",
      wilayah: "Sawojajar",
      court: 1,
      isParkingLotExist: true,
      imageUrl:
      "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg",
      desc: textDesc),
  Futsal(
      lat: -8.000205175272578,
      lon: 112.62609894096276,
      title: "AS Futsal",
      time: "0:00 - 22:00",
      wilayah: "Sukun",
      court: 3,
      isParkingLotExist: true,
      imageUrl:
      "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg",
      desc: textDesc),
  Futsal(
      lat: -7.984683115419867,
      lon: 112.59789188889955,
      title: "NIKOLAS FUTSAL 1",
      time: "07:00 - 23:00",
      wilayah: "Sukun",
      court: 1,
      isParkingLotExist: true,
      imageUrl:
      "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg",
      desc: textDesc),
  Futsal(
      lat: -7.946614883987896,
      lon: 112.63979520647315,
      title: "BHS Futsal",
      time: "07:00 - 23:00",
      wilayah: "Blimbing",
      court: 1,
      isParkingLotExist: true,
      imageUrl:
      "https://cdnwpedutorenews.gramedia.net/wp-content/uploads/2022/08/29031825/cover-15.jpg",
      desc: textDesc),
];

class FutsalApi{
  int id;
  String title;
  String nohp;
  String alamat;
  String wilayah;
  double lat;
  double lon;
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

List<FutsalApi> lisFutsalApi = [
  FutsalApi(id: 1, title: "Zona SM Futsal" , nohp: "085708080801", alamat: "Jalan Sudimoro Utara, Mojolangu, Lowokwaru, Mojolangu, Kec. Lowokwaru, Kota Malang, Jawa Timur 65142", wilayah: "Mojolangu", lat: -7.932197814653308, lon: 112.63001005488609, jenislapangan: "Matras", jumlahlapangan: "10 Lapangan", fasilitas: "kafetaria, ruang tunggu serta tempat parkir yang luas.", harga: "120.000", buka: "24 Jam ", imageUrl: "1669632389_f2af11dba2d40e5c624b.png", typeBooking:"Online"),
  FutsalApi(id: 2, title: "Champions Futsal Puncak Mandala", nohp: "081333582999", alamat: "Jl. Puncak Mandala No.42 - 44, Pisang Candi, Kec. Sukun, Kota Malang, Jawa Timur 65146", wilayah: "Sukun", lat: -7.963793136781813, lon: 112.60405564682114, jenislapangan: "Matras", jumlahlapangan: "5 Lapangan", fasilitas: "Kamar mandi dengan air panas, musala dan kafetaria.", harga: "100.000", buka: "09.00 - 23.00", imageUrl: "1669632004_9714bae0be888b37234a.png", typeBooking: "Online"),
  FutsalApi(id: 3, title: "Ongisnade Futsal", nohp: "-", alamat: "Jl. Sigura - Gura No.3, Karangbesuki, Kec. Sukun, Kota Malang, Jawa Timur 65145", wilayah: "Karangbesuki", lat: -7.955080244829175, lon: 112.6047852076709, jenislapangan: "Plester", jumlahlapangan: "2 Lapangan", fasilitas: "Kamar mandi, parkiran.", harga: "80.000", buka: "07.00 - 22.00", imageUrl: "1669632004_9714bae0be888b37234a.png", typeBooking: "Langsung pesan"),
];

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
