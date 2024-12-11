import 'package:flutter/material.dart';

class Explorer extends StatefulWidget {
  const Explorer({super.key});

  @override
  State<Explorer> createState() => _ExplorerState();
}

class _ExplorerState extends State<Explorer> with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
                buildProductList('Terlaris'),
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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: buildSearchButton(), // Ganti teks dengan widget search bar
      ),
    ),
  );
}


  Widget buildSearchButton() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.blueAccent, // Ganti kButtonColor jika perlu
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5))
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Cari Destinasi...',
          hintStyle: TextStyle(
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

  Widget buildProductList(String category) {
    // Simulasi data produk
    final List<Map<String, String>> products = [
      {
        'name': 'Martabak Bangka - Sinar',
        'category': category,
        'price': 'Rp.25.000',
        'image': 'https://via.placeholder.com/100',
      },
      {
        'name': 'Nasi Goreng Gila - Muka',
        'category': category,
        'price': 'Rp.17.000',
        'image': 'https://via.placeholder.com/100',
      },
      {
        'name': 'Roti Bakar - Sinar',
        'category': category,
        'price': 'Rp.20.000',
        'image': 'https://via.placeholder.com/100',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: Image.network(
              product['image']!,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(
              product['name']!,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              product['price']!,
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
