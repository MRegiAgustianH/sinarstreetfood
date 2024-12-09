import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/models/produk_model.dart';
import 'package:wisata_mobile_5/screens/detailproduk.dart';
import 'package:wisata_mobile_5/screens/favoriteproduk.dart';
import 'package:wisata_mobile_5/screens/populerproduk.dart';
import 'package:wisata_mobile_5/screens/rekomendasiproduk.dart';
import 'package:wisata_mobile_5/utils/const.dart';
import 'package:wisata_mobile_5/widget/popular_produk.dart';
import 'package:wisata_mobile_5/widget/rekomendasi_produk.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home_filled,
    Icons.favorite_rounded
  ];

  List<Produk> popular = listProduk
      .where((element) => element.category == 'popular')
      .toList();
  List<Produk> rekomendasi = listProduk
      .where((element) => element.category == 'rekomendasi')
      .toList();
      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          buildAppBar(),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Produk populer',
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                      
                ),
                GestureDetector(
                  onTap: () {
                    // Ganti 'PopularProductsScreen' dengan nama layar yang sesuai
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PopularProductsScreen(popularProducts: popular), // Ganti 'popular' dengan daftar produk populer Anda
                      ),
                    );
                  },
                  child: Text(
                    'Lihat Semua',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: blueTextColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(bottom: 20, left: 20),
            child: Row(
              children: List.generate(
                popular.length,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailProdukScreen(
                                  produk: popular[index])));
                    },
                    child: PopularProduk(
                      produk: popular[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rekomendasi Untuk Kamu',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RekomendasiProdukScreen(rekomendasiproduk: rekomendasi), // Ganti 'popular' dengan daftar produk populer Anda
                          ),
                        );
                      },
                      child: Text(
                        'Lihat Semua',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: blueTextColor),
                      ),
                    ),
                  ],
                ),
              ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: List.generate(
                  rekomendasi.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailProdukScreen(
                                  produk: rekomendasi[index])));
                      },
                      child: RekomendasiProduk(
                        produk: rekomendasi[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  decoration: BoxDecoration(
                    color: kButtonColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      icons.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPage = index;
                          });
                          if (index == 1) { // Jika ikon yang diklik adalah favorit
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FavoriteProductsScreen(),
                              ),
                            );
                          }
                        },
                        child: Icon(
                          icons[index],
                          size: 32,
                          color: selectedPage == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildAppBar() {
  return Container(
    height: 120,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 5,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: SafeArea(
        child: Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
        child: buildSearchButton(),
      ),
    )),
  );
}

Widget buildSearchButton() {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    decoration: BoxDecoration(
      color: kButtonColor,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5))
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Cari Produk...',
        hintStyle: TextStyle(
          fontFamily: "Poppins",
          color: Colors.white54,
          fontSize: 18,
        ),
        prefixIcon: Icon(Icons.search, color: Colors.white54, size: 28),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 12),
      ),
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  );
}
