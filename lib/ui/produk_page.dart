import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_detail.dart';
import 'package:tokokita/ui/produk_form.dart';
import 'package:tokokita/ui/login_page.dart';


class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Produk Galangtzy'),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.add, size: 26.0),
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProdukForm()));
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            ItemProduk(
              produk: Produk(
                  id: 1,
                  kodeProduk: 'A001',
                  namaProduk: 'Kamera',
                  hargaProduk: 5000000),
            ),
            ItemProduk(
              produk: Produk(
                  id: 2,
                  kodeProduk: 'A002',
                  namaProduk: 'Kulkas',
                  hargaProduk: 2500000),
            ),
            ItemProduk(
              produk: Produk(
                  id: 3,
                  kodeProduk: 'A003',
                  namaProduk: 'Mesin Cuci',
                  hargaProduk: 2000000),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;

  const ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetail(
                  produk: produk,
                )));
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          title: Text(
            produk.namaProduk!,
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            'Rp ${produk.hargaProduk}',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
