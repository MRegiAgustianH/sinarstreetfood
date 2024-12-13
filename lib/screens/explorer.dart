import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/models/produk_model.dart';

class Explorer extends StatefulWidget {
  const Explorer({super.key});

  @override
  State<Explorer> createState() => _ExplorerState();
}

class _ExplorerState extends State<Explorer> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Produk> filteredProducts = listProduk.where((element) => element.category == 'rekomendasi').toList();
  List<Produk> filteredProducts2 = listProduk.where((element) => element.category == 'popular').toList();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: buildAppBar(),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blueAccent,
            tabs: const [
              Tab(text: 'Rekomendasi'),
              Tab(text: 'Terlaris'),
              Tab(text: 'Top Rating'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildProductList('Rekomendasi'),
                buildProductList2('Terlaris'),
                buildProductList('Top Rating'),
              ],
            ),
          ),
        ],
      ),
    );
  }

Widget buildAppBar() {
  return Container(
    height: 120, // Tinggi disesuaikan agar muat untuk search bar
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 5,
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: buildSearchButton(), // Ganti teks dengan widget search bar
      ),
    ),
  );
}


  Widget buildSearchButton() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.blueAccent, // Ganti kButtonColor jika perlu
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
      children: [
        const Icon(Icons.search, color: Colors.white54, size: 28),
        const SizedBox(width: 8), // Jarak antara ikon dan TextField
        Expanded(
          child: const TextField(
              decoration: InputDecoration(
                hintText: 'Cari Makanan...',
                hintStyle: TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 6),
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductList(String category) {
    // Filter produk berdasarkan kategori

   return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final produk = filteredProducts[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: produk.image.isNotEmpty 
                ? Image.asset(
                    produk.image[0], 
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.image_not_supported), 
            title: Text(
              produk.name,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              produk.price.toString(),
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      },
    );
  }

  Widget buildProductList2(String category) {
    // Filter produk berdasarkan kategori

   return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredProducts2.length,
      itemBuilder: (context, index) {
        final produk = filteredProducts2[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: produk.image.isNotEmpty 
                ? Image.asset(
                    produk.image[0], 
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.image_not_supported), 
            title: Text(
              produk.name,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              produk.price.toString(),
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      },
    );
  }
}


