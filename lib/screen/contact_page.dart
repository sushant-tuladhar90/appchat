import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> users = [
    {
      "name": "John Doe",
      "lastSeen": "Yesterday",
      "profilePic": "assets/images/Avatar1.png",
    },
    {
      "name": "Jane Smith",
      "lastSeen": "2 hours ago",
      "profilePic": "assets/images/Avatar2.png",
    },
    {
      "name": "Sushant Tuladhar",
      "lastSeen": "1 day ago",
      "profilePic": "assets/images/Sushant.jpg",
    },
    {
      "name": "Kanchan Babu Neupane",
      "lastSeen": "1 day ago",
      "profilePic": "assets/images/kanchan.jpeg",
    },
    {
      "name": "Alex Johnson",
      "lastSeen": "1 day ago",
      "profilePic": "assets/images/Avatar2.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(height: 50, width: 15),
              const Text(
                "Contacts",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'mulish',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // Add your action for the icon here
                },
                child: Image.asset(
                  "assets/images/add.png",
                  height: 45,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xFFADB5BD),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'mulish',
                    color: Color.fromARGB(255, 199, 206, 212),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 199, 206, 212),
                  ),
                  fillColor: const Color.fromARGB(255, 241, 241, 246),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            users[index]["profilePic"]!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          users[index]["name"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'mulish',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "Last seen: ${users[index]["lastSeen"]!}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'mulish',
                            color: Color.fromARGB(255, 186, 189, 192),
                          ),
                        ),
                      ),
                      const Divider(
                        color: Color.fromARGB(255, 236, 229, 229),
                        height: 1,
                        thickness: 0.5,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
