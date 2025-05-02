import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FungicideScreen extends StatelessWidget {
  const FungicideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3D5C2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF7A00),
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: Text('Fungicide', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Image.asset('assets/images/box.png', width: 26),
                const SizedBox(width: 10),
                Image.asset('assets/images/heart.png', width: 26),
                const SizedBox(width: 10),
                Image.asset('assets/images/notification.png', width: 26),
              ],
            ),
          )
        ],
      ),
      body: Container(
        
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF3D5C2), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchBar(),
              const SizedBox(height: 18),
              buildSectionHeader('Deals of the day', showSort: true),
              const SizedBox(height: 12),
              buildDealGrid(),
              const SizedBox(height: 12),
              buildViewAllButton(),

              const SizedBox(height: 28),
              buildSectionHeader('Our Fungicide Products'),
              const SizedBox(height: 12),
              buildProductGrid(),
              const SizedBox(height: 12),
              buildViewAllButton(),

              const SizedBox(height: 28),
              buildSectionHeader('New On Fungicide'),
              const SizedBox(height: 12),
              buildProductGrid(),
              const SizedBox(height: 12),
              buildViewAllButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Reward'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search by item/crop/chemical name',
          hintStyle: GoogleFonts.poppins(fontSize: 14),
          prefixIcon: const Icon(Icons.search, size: 22),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title, {bool showSort = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
        if (showSort)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Icon(Icons.sort, size: 16, color: Colors.black),
                SizedBox(width: 4),
                Text('Sort By', style: TextStyle(fontSize: 13)),
              ],
            ),
          )
      ],
    );
  }

  Widget buildDealGrid() {
    List<Map<String, String>> deals = [
      {'name': 'AURASTAR', 'image': 'assets/images/hyfen.png', 'old': '2000', 'new': '1550'},
      {'name': 'AZEEM', 'image': 'assets/images/valaxa.png', 'old': '2000', 'new': '1000'},
      {'name': 'VALAX', 'image': 'assets/images/valaxa.png', 'old': '2000', 'new': '1550'},
      {'name': 'OXYFEN', 'image': 'assets/images/oxyfen.png', 'old': '2000', 'new': '1000'},
      {'name': 'HYFEN', 'image': 'assets/images/hyfen.png', 'old': '2000', 'new': '1550'},
      {'name': 'CARCOCH', 'image': 'assets/images/valaxa.png', 'old': '2000', 'new': '1550'},
    ];

    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 120 / 150,
      children: deals.map((item) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Image.asset(item['image']!, height: 60),
              const SizedBox(height: 6),
              Text(item['name']!, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14)),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '₹${item['old']} ',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: '₹${item['new']}/piece',
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

 Widget buildProductGrid() {
  List<String> names = ['OXYFEN', 'HYFEN', 'VALAXA', 'OXYFEN', 'HYFEN', 'VALAXA'];
  List<String> images = [
    'assets/images/oxyfen.png',
    'assets/images/hyfen.png',
    'assets/images/valaxa.png',
    'assets/images/oxyfen.png',
    'assets/images/hyfen.png',
    'assets/images/valaxa.png'
  ];

  return GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: names.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 136 / 245,
    ),
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(child: Image.asset(images[index], height: 65)),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: const Icon(Icons.favorite_border, size: 16, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              names[index],
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            const SizedBox(height: 2),
            const Text('Oxyflourfen 23.5 % EC', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 2),
            const Text('Unit Size: 12 pieces', style: TextStyle(fontSize: 12, color: Colors.orange)),
            const SizedBox(height: 8),
            Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(6),
              ),
              child: DropdownButton<String>(
                value: '500 ML',
                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.orange),
                underline: const SizedBox(),
                isExpanded: true,
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
                items: const [
                  DropdownMenuItem(value: '500 ML', child: Text('500 ML')),
                ],
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 38,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text('Add', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      );
    },
  );
}


  Widget buildViewAllButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text('View All'),
      ),
    );
  }
}
