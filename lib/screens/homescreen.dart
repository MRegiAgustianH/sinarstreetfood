import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/models/produk_model.dart';
import 'package:wisata_mobile_5/screens/detailproduk.dart';
import 'package:wisata_mobile_5/screens/explorer.dart';
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
    Icons.explore,
    Icons.favorite_rounded,
  ];

  List<Produk> popular =
      listProduk.where((element) => element.category == 'popular').toList();
  List<Produk> rekomendasi =
      listProduk.where((element) => element.category == 'rekomendasi').toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: IndexedStack(
        index: selectedPage,
        children: [
          buildHomePage(context),
          Explorer(),
          FavoriteProductsScreen(),
          // buildExplorePage(context),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildHomePage(BuildContext context) {
    return Column(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PopularProductsScreen(popularProducts: popular),
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
                            builder: (_) =>
                                DetailProdukScreen(produk: popular[index])));
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
                      builder: (context) => RekomendasiProdukScreen(
                          rekomendasiproduk: rekomendasi),
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
      ],
    );
  }

  // Widget buildExplorePage(BuildContext context) {
  //   return Center(
  //     child: Text(
  //       'Halaman Explore',
  //       style: TextStyle(
  //         fontFamily: "Poppins",
  //         fontSize: 18,
  //         fontWeight: FontWeight.w600,
  //         color: Colors.black,
  //       ),
  //     ),
  //   );
  // }

  Widget buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
    );
  }

  Widget buildAppBar() {
    return Container(
      height: 80,
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
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Selamat Datang',
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
