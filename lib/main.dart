import 'package:fic_slicing/detail_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.grey),
          centerTitle: true,
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.black),
          ),
          leading: const Icon(Icons.menu),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Discover the most modern furniture',
                style: TextStyle(fontSize: 22),
                maxLines: 2,
              ),
            ),
            TabBar(
              isScrollable: true,
              indicatorColor: const Color(0xff9A9390),
              splashBorderRadius: BorderRadius.circular(20),
              labelPadding: const EdgeInsets.symmetric(horizontal: 22 + 8),
              indicator: BoxDecoration(
                color: const Color(0xff9A9390),
                borderRadius: BorderRadius.circular(20),
              ),
              labelStyle: const TextStyle(fontSize: 12),
              unselectedLabelColor: const Color(0xff9A9390),
              padding: const EdgeInsets.only(left: 22),
              // labelColor: Colors.black,
              controller: _tabController,
              tabs: const <Widget>[
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Living Room',
                ),
                Tab(
                  text: 'Bedroom',
                ),
                Tab(
                  text: 'Dining Room',
                ),
                Tab(
                  text: 'Kitchen',
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Recommended Furnitures',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // crossAxisSpacing: 15.0,
                    // mainAxisSpacing: 15.0,
                    childAspectRatio: 2 / 3),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const DetailView())),
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 22, right: 8, bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 4,
                            child: Stack(
                              children: [
                                Container(
                                  height: 163,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/images/img1.png'),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child:  Image.asset('assets/icons/ic_love.png'),
                                ),
                              ],
                            ),
                          ),
                          const Flexible(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 14, top: 12, bottom: 5),
                              child: Text(
                                "Stylish Chair",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 14, right: 18.0, bottom: 12.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "\$170",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.brown,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/icons/ic_star.png'),
                                      const SizedBox(width: 8),
                                      const Text(
                                        '4.8',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.brown,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
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
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/ic_home.png'),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/ic_cart.png'),
              label: 'cart',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/ic_star_2.png'),
              label: 'star',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/ic_profile.png'),
              label: 'profile',
            ),
          ],
        ),
      ),
    );
  }
}
