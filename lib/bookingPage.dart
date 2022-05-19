import 'package:aplikasi_sewa_lapangan_futsal/book_now.dart';
import 'package:aplikasi_sewa_lapangan_futsal/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int _pilihIndex = 0;

  void _UbahPilihIndex(int index) {
    setState(() {
      _pilihIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2d2d0),
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text('Booking'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.exit_to_app_rounded,
              size: 25,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              wHeroImage(),
            ],
          ),
          Center(
            child: Align(
              alignment: Alignment(0, -0.12),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                height: MediaQuery.of(context).size.height * 0.32,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 18, left: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Mitra Futsal',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 25),
                                    child: RaisedButton(
                                      color: Colors.indigoAccent,
                                      textColor: Colors.white,
                                      child: Text('Book Now'),
                                      shape: StadiumBorder(),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return BookNow();
                                        }));
                                      },
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                              ),
                              Text(
                                'Harga Booking',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                              ),
                              Text(
                                'Rp 50.000,-',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 18),
                              ),
                              Text(
                                'Fasilitas',
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 18),
                              ),
                              Row(
                                children: <Widget>[
                                  buildContainer('Wi-Fi'),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  buildContainer('Kamar Ganti'),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  buildContainer('Music'),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  buildContainer('Rompi'),
                                  Spacer(
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 405, left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detail Informasi',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                  ),
                  Text(
                    'Harga Lapangan jam 07.00 - 15.00 Rp 80.000 / Jam',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                  ),
                  Text(
                    'Harga Lapangan jam 15.00 - 23.00 Rp 100.000 / Jam',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add_check_rounded),
            backgroundColor: Colors.blue,
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Cek Jadwal',
          ),
        ],
        currentIndex: _pilihIndex,
        selectedItemColor: Colors.indigoAccent,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        onTap: _UbahPilihIndex,
      ),
    );
  }

  Container buildContainer(String text) {
    return Container(
      height: 32,
      width: 80,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 13),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.indigoAccent),
      ),
    );
  }
}
