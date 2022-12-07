class Futsal{
  double lat;
  double lon;
  String title;
  String time;
  int court;
  bool isParkingLotExist;

  Futsal({required this.lat, required this.lon, required this.title, required this.time, required this.court, required this.isParkingLotExist});
}

List<Futsal> listFutsalCourt = [
  Futsal(lat: -7.939889704539739, lon: 112.60540675051458, title: "Caesar Futsal", time: "07.00 - 22.00", court: 3, isParkingLotExist: true),
  Futsal(lat: -7.927232695284277, lon: 112.60447546317106, title: "Champions Futsal Tlogomas ", time: "08.00 - 22.00", court: 5, isParkingLotExist: true),
  Futsal(lat: -7.93589388773497, lon: 112.60048884063167, title: "Buana Futsal", time: "09.00 - 21.00", court: 3, isParkingLotExist: true),
  Futsal(lat: -7.945319095666317, lon: 112.61746413660579, title: "Viva Futsal", time: "06.00 - 02.00", court: 3, isParkingLotExist: true),


];
