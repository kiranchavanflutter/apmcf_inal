import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//appBar
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            side: BorderSide(width: 0),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0))),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 60, 190, 89),
        shadowColor: Colors.green,
        title: Row(
          children: [
            Image.asset('assets/fcare.jpeg', height: 75, width: 80),
            const SizedBox(width: 35),
            const Text(
              'APMC System',
              style: TextStyle(
                color: Colors.black,
                //backgroundColor: Color.fromARGB(255, 20, 184, 28),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      //impltation of Body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(width: 0),

            //live market button
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/liveMarket');
                },
                clipBehavior: Clip.antiAlias,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Image.asset('assets/liveMarket.jpeg', height: 115)),
            const SizedBox(width: 29),

            //Treder Button

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
                )),
          ]),
          const SizedBox(height: 35),

          //wether button
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
              child: Image.asset('assets/wether.jpeg', height: 115)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 12),

              //letest News button
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
                  child: Image.asset('assets/news.jpeg', height: 115)),
              const SizedBox(width: 29),

              //farmer button
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
                  child: Image.asset('assets/farmer.jpeg', height: 115)),
              const SizedBox(width: 15),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 11),

              //about Apmc button
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
                  child: Image.asset('assets/aboutApmc.jpeg', height: 115)),
              const SizedBox(width: 30),

              //contactUs button
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
                  child: Image.asset('assets/contactUs.jpeg', height: 130)),
              const SizedBox(width: 30),
            ],
          ),
        ],
      ),
    );
  }
}
