import 'package:farmcare/DataBase/biddingdata.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> product = [];

class HomePage extends StatelessWidget {
  Future<void> fetchData() async {
    List<BiddingDataBase> list = await getData();
    

    for (int i = 0; i < list.length; i++) {
      String productName = list[i].productName;
      num bidPrice = list[i].bidPrice;

      // Check if the product already exists in the product list
      bool productExists = false;
      int productIndex = -1;
      for (int j = 0; j < product.length; j++) {
        if (product[j]['Product'] == productName) {
          productExists = true;
          productIndex = j;
          break;
        }
      }

      // If the product doesn't exist, add it to the product list
      if (!productExists) {
        product.add({
          'Product': productName,
          'Price': [bidPrice],
          'MaxPrice': bidPrice,
          'MinPrice': bidPrice,
          'AvgPrice': bidPrice,
        });
      } else {
        // If the product exists, update its price list
        product[productIndex]['Price'].add(bidPrice);
        num minp = product[productIndex]['Price'][0];
        num maxp = product[productIndex]['Price'][0];
        num avg = 0;

        for (int k = 0; k < product[productIndex]['Price'].length; k++) {
          print(
              '${product[productIndex]['Price'][k]} ..........................');
          if (product[productIndex]['Price'][k] > maxp) {
            maxp = product[productIndex]['Price'][0];
            //print('$maxp ..........................');
          }
          if (product[productIndex]['Price'][k] < minp) {
            product[productIndex]['Price'][k];
          }
          avg = avg + product[productIndex]['Price'][0];
        }
        avg = avg / product[productIndex]['Price'].length;
        product[productIndex]['MaxPrice'] = maxp;
        product[productIndex]['MinPrice'] = minp;
        product[productIndex]['AvgPrice'] = avg;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          side: BorderSide(width: 0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 60, 190, 89),
        shadowColor: Colors.green,
        title: Row(
          children: [
            Image.asset('assets/fcare.jpeg', height: 75, width: 80),
            const SizedBox(width: 35),
            const Text(
              'APMC System',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await fetchData();
                    Navigator.pushNamed(context, '/liveMarket');
                  },
                  clipBehavior: Clip.antiAlias,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Image.asset('assets/liveMarket.jpeg', height: 115),
                ),
                const SizedBox(width: 29),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/trader');
                  },
                  clipBehavior: Clip.antiAlias,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Image.asset(
                    'assets/traders.jpeg',
                    height: 130,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/weather');
              },
              clipBehavior: Clip.antiAlias,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Image.asset('assets/wether.jpeg', height: 115),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/latestNews');
                  },
                  clipBehavior: Clip.antiAlias,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Image.asset('assets/news.jpeg', height: 115),
                ),
                const SizedBox(width: 29),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/farmer');
                  },
                  clipBehavior: Clip.antiAlias,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Image.asset('assets/farmer.jpeg', height: 115),
                ),
                const SizedBox(width: 15),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 11),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/aboutAPMC');
                  },
                  clipBehavior: Clip.antiAlias,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Image.asset('assets/aboutApmc.jpeg', height: 115),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/contactUs');
                  },
                  clipBehavior: Clip.antiAlias,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Image.asset('assets/contactUs.jpeg', height: 130),
                ),
                const SizedBox(width: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
