import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/lists.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  void _onBottomNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Implement navigation logic based on the selected index
    switch (index) {
      case 0: // Home
        // No navigation needed as it's the current page
        break;
      case 1: // Category
        // Implement navigation to CategoryView
        break;
      case 2: // MyAppointmentsApp
        // Implement navigation to MyAppointmentsApp
        break;
      case 3: // SettingsView
        // Implement navigation to SettingsView
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          children: [
            SizedBox(width: 60),
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                "https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_1280.png",
              ),
              radius: 50,
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Christina Amandla"),
                Text("Let's learn to be smart"),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: () {
                print('search icon pressed');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            SizedBox(
              height: 300,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: iconlist.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Implement navigation to the specific course page
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: PopularCourseCard(
                        title: icontitlelist[index],
                        iconPath: iconlist[index],
                        participantCount: 20,
                        rating: 4.8,
       
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(color: Colors.white),
        selectedIconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 2, 124, 223),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onBottomNavBarItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Appointments"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}

// Define the PopularCourseCard class within the same file
class PopularCourseCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final int participantCount;
  final double rating;


  const PopularCourseCard({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.participantCount,
    required this.rating,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: 200, // Set a fixed width for consistency
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: iconPath,
            width: 100, // Adjust width as needed
            height: 100, // Adjust height as needed
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                 Icon(Icons.people, size: 18.0),
             SizedBox(width: 4.0),
                  Text(
                    '$participantCount Participant',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
             SizedBox(height: 4.0), 
              Row(
                children: [
                   Icon(Icons.star, size: 18.0),
                  SizedBox(width: 4.0),
                  Text(
                    '$rating (5)',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
