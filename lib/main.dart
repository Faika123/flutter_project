import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
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

class DetailPage extends StatelessWidget {
  final String image;
  final String price;

  DetailPage({required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Details'),
        actions: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red,
            ),
            onPressed: () {
              // Action pour ajouter aux favoris
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              price,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Bedroom in luxury Home with all the necessary amenities and modern facilities. This room offers a comfortable stay with beautiful interiors and scenic views. Ideal for both short and long stays.",
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Action pour la réservation
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Book Now',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
