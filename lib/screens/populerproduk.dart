import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/models/produk_model.dart';
import 'package:wisata_mobile_5/screens/detailproduk.dart';
import 'package:wisata_mobile_5/widget/popular_produk.dart';

class PopularProductsScreen extends StatelessWidget {
  final List<Produk> popularProducts;

  const PopularProductsScreen({Key? key, required this.popularProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Produk Populer',
          style: TextStyle(fontFamily: "Poppins"
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: popularProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      DetailProdukScreen(produk: popularProducts[index]),
                ),
              );
            },
            child: PopularProduk(produk: popularProducts[index]),
          );
        },
      ),
    );
  }
}
