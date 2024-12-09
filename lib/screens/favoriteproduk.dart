import 'package:flutter/material.dart';

class FavoriteProductsScreen extends StatelessWidget {
  const FavoriteProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produk Favorit',style: TextStyle(fontFamily: "Poppins",),),
      ),
      body: Center(
        child: Text(
          'Belum ada produk favorit',
          style: TextStyle(fontFamily: "Poppins", fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}