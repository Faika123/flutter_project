import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login.dart';
import 'detailpage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'image': 'images/image1.jpg', 'price': '\$100/night'},
    {'image': 'images/image2.jpg', 'price': '\$150/night'},
    {'image': 'images/image3.jpg', 'price': '\$200/night'},
    {'image': 'images/image4.jpg', 'price': '\$350/night'},
    {'image': 'images/image5.jpg', 'price': '\$500/night'},
    {'image': 'images/image1.jpg', 'price': '\$450/night'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find, your Room',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.notifications),
            color: Colors.black,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text(
              'Se connecter',
              style: TextStyle(color: const Color.fromARGB(255, 252, 52, 2)),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          // Action à exécuter lors de l'appui sur l'icône de paramètres
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Première ligne de cartes horizontale
              SizedBox(
                height: 300, // Ajuste la hauteur pour les cartes
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length ~/ 2,
                  itemBuilder: (context, index) {
                    return _buildCard(context, index);
                  },
                ),
              ),
              SizedBox(height: 20),
              // Section "Our Rooms" et "View All"
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Our Rooms",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Action pour "View All"
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Deuxième ligne de cartes horizontale
              SizedBox(
                height: 300, // Ajuste la hauteur pour les cartes
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length - (items.length ~/ 2),
                  itemBuilder: (context, index) {
                    return _buildCard(context, index + (items.length ~/ 2));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              image: items[index]['image']!,
              price: items[index]['price']!,
            ),
          ),
        );
      },
      child: Container(
        width: 200, // Largeur de chaque carte
        margin: EdgeInsets.only(right: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.solidHeart,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
              Expanded(
                child: Image.asset(
                  items[index]['image']!,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  items[index]['price']!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const Text(
                "Bedroom in luxury Home",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.5,
                  color: Color.fromARGB(255, 11, 11, 11),
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.5,
                  wordSpacing: 2.5,
                ),
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.solidStar, color: Colors.red),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
