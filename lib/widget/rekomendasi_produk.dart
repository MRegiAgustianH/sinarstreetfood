import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/models/produk_model.dart';
import 'package:wisata_mobile_5/utils/const.dart';

class RekomendasiProduk extends StatefulWidget {
  final Produk produk;
  const RekomendasiProduk({super.key, required this.produk});

  @override
  State<RekomendasiProduk> createState() => _RekomendasiProdukState();
}

class _RekomendasiProdukState extends State<RekomendasiProduk> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Container(
            height: 85,
            width: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.produk.image![0]),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.produk.name,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.yellow[800],
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${widget.produk.rate} ",
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: "(${widget.produk.review} reviews)",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Rp${widget.produk.price}K",
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: blueTextColor),
                      ),
                      TextSpan(
                        text: "/Pcs",
                        style: TextStyle(fontFamily: "Poppins",
                            fontSize: 10, color: Colors.black.withOpacity(0.6)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}