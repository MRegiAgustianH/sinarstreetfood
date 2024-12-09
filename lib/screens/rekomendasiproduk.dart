import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/models/produk_model.dart';
import 'package:wisata_mobile_5/screens/detailproduk.dart';
import 'package:wisata_mobile_5/widget/rekomendasi_produk.dart';

class RekomendasiProdukScreen extends StatelessWidget {
  final List<Produk> rekomendasiproduk;
  const RekomendasiProdukScreen({super.key, required this.rekomendasiproduk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Produk Rekomendasi',
          style: TextStyle(fontFamily: "Poppins"),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: rekomendasiproduk.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailProdukScreen(produk: rekomendasiproduk[index]),
                ),
              );
            },
            child: RekomendasiProduk(produk: rekomendasiproduk[index]),
          );
        },
      ),
    );
  }
}