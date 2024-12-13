import 'dart:math';

Random random = Random();
const description =
    'Makanan street food menawarkan beragam cita rasa, masing-masing dengan keunikan dan daya tarik tersendiri. Dari camilan gurih hingga hidangan manis, selalu ada sesuatu untuk memuaskan setiap pecinta kuliner.';

class Produk {
  final int id, price, review;
  final List<String> image;
  final String name, description, category;
  final double rate;
  
  Produk({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.review,
    required this.price,
    required this.description,
    required this.rate,
    
  });
}

List<Produk> listProduk = [
  // Popular Produk
  Produk(
      id: 1,
      name: "Martabak",
      category: 'popular',
      image: [
        "assets/images/martabak.jpeg",
        "assets/images/martabak2.jpg",
        "assets/images/martabak3.jpg",
      ],
      review: random.nextInt(250) + 20,
      price: 25,
      description: description,
      rate: 4.8),
  Produk(
      id: 2,
      name: "Pecel Lele",
      category: 'popular',
      image: [
        "assets/images/pecellele.jpg",
        "assets/images/pecellele2.jpg",
        "assets/images/pecellele3.jpg",
      ],
      review: random.nextInt(250) + 20,
      price: 8,
      description: description,
      rate: 4.9),
  Produk(
      id: 3,
      name: "Gorengan",
      category: 'popular',
      image: [
        "assets/images/gorengan.jpg",
        "assets/images/kuning.jpeg",
        "assets/images/hijau.jpeg",
      ],
      review: random.nextInt(250) + 20,
      price: 1,
      description: description,
      rate: 4.8),
  Produk(
      id: 4,
      name: "Nasi Goreng",
      category: 'popular',
      image: [
        "assets/images/nasigoreng.jpg",
        "assets/images/kuning.jpeg",
        "assets/images/hijau.jpeg",
      ],
      review: random.nextInt(250) + 20,
      price: 15,
      description: description,
      rate: 4.7),

  // Recommended 
  Produk(
    id: 5,
    name: "Telor Gulung",
    category: 'rekomendasi',
    image: [
        "assets/images/telorgulung.jpg",
        "assets/images/telorgulung2.jpg",
        "assets/images/hijau.jpeg",
    ],
    review: random.nextInt(250) + 20,
    price: 2,
    description: description,
    rate: 4.6,
  ),
  Produk(
      id: 6,
      name: "Sate Maranggi",
      category: 'rekomendasi',
      image: [
        "assets/images/satemaranggi.jpg",
        "assets/images/kuning.jpeg",
        "assets/images/hijau.jpeg",
      ],
      review: random.nextInt(250) + 20,
      price: 3,
      description: description,
      rate: 4.5),
  Produk(
      id: 7,
      name: "Lontong Sayur",
      category: 'rekomendasi',
      image: [
        "assets/images/lontongsayur.jpg",
        "assets/images/kuning.jpeg",
        "assets/images/hijau.jpeg",
      ],
      review: random.nextInt(250) + 20,
      price: 15,
      description: description,
      rate: 4.7),
  Produk(
      id: 8,
      name: "Kue Pukis",
      category: 'rekomendasi',
      image: [
        "assets/images/kuepukis.jpg",
        "assets/images/kuning.jpeg",
        "assets/images/hijau.jpeg",
      ],
      review: random.nextInt(250) + 20,
      price: 2,
      description: description,
      rate: 4.7),
  Produk(
      id: 9,
      name: "Ayam Goreng",
      category: 'rekomendasi',
      image: [
        "assets/images/ayamgoreng.jpg",
        "assets/images/kuning.jpeg",
        "assets/images/hijau.jpeg",
      ],
      review: random.nextInt(250) + 20,
      price: 8,
      description: description,
      rate: 4.8),
];
