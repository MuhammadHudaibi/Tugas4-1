import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Sample data for the GridView
  final List<ItemData> items = [
    ItemData('Apple pie', '90 Menit', 'images/apple_pie.jpeg', 'Deskripsi', Colors.amber),
    ItemData('Beaf Burger', '90 Menit', 'images/burger.jpg', 'Deskripsi', Colors.amber),
    ItemData('Ramen Udang', '90 Menit', 'images/ramen.jpg', 'Soon', Colors.red),
    ItemData('Karage', '90 Menit', 'images/karage.jpg', 'Deskripsi', Colors.amber),
    ItemData('Takoyaki', '90 Menit', 'images/takoyaki.jpeg', 'Deskripsi', Colors.amber),
  ];

  final List<ItemKategori> itemk = [
    ItemKategori('All', 'images/category.png'),
    ItemKategori('Makanan', 'images/food.png'),
    ItemKategori('Buah', 'images/fruits.png'),
    ItemKategori('Sayur', 'images/vegetable.png'),
    ItemKategori('Minuman', 'images/drink.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 4-1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'images/logo.png',
                width: 120,
                height: 75,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/search.png', 
                        width: 24,
                        height: 24, 
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: GoogleFonts.poppins(),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Katalog Resep Makanan',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.settings, color: Colors.red,), 
                ],
              ),
            ),

            // ListView 
            SizedBox(
              height: 30, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                       color: Colors.red,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          itemk[index].kategoriImg,
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 8),
                        Text(
                          itemk[index].kategoriTeks,
                          style: GoogleFonts.poppins(fontSize: 16)
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),


            // GridView
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.75, 
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GridTile(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                            child: Image.asset(
                              items[index].imageUrl,
                              width: double.infinity,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                            child: Text(
                              items[index].text,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 25),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/clock.png',
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items[index].secondaryText,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: items[index].warna,
                                      ),
                                      padding: EdgeInsets.all(4),
                                      child: Text(
                                        items[index].thirdText,
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 8
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
      
          },
          child: Icon(Icons.add, color: Colors.white,),
          shape: CircleBorder(),
        ),
      ),
    );
  }
}

class ItemKategori {
  final String kategoriTeks;
  final String kategoriImg;

  ItemKategori(this.kategoriTeks, this.kategoriImg);
}

// Data class to represent items
class ItemData {
  final String text;
  final String secondaryText;
  final String imageUrl;
  final String thirdText;
  final Color warna;

  ItemData(this.text, this.secondaryText, this.imageUrl, this.thirdText, this.warna);
}