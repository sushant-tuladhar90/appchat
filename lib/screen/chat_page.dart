import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> chats = [
    {
      "name": "John Doe",
      "lastMessage": "Hey, how are you?",
      "time": "Yesterday",
      "profilePic": "assets/images/Avatar1.png",
    },
    {
      "name": "Jane Smith",
      "lastMessage": "Can we catch up later?",
      "time": "2 hours ago",
      "profilePic": "assets/images/Avatar2.png",
    },
    {
      "name": "Sushant Tuladhar",
      "lastMessage": "Sure, let me know.",
      "time": "1 day ago",
      "profilePic": "assets/images/Sushant.jpg",
    },
    {
      "name": "Kanchan Babu Neupane",
      "lastMessage": "Sure, let me know.",
      "time": "2 hours ago",
      "profilePic": "assets/images/kanchan.jpeg",
    },
    {
      "name": "Alex Johnson",
      "lastMessage": "Sure, let me know.",
      "time": "2 hours ago",
      "profilePic": "assets/images/Avatar2.png",
    },
  ];

  List<Map<String, String>> stories = [
    {
      "name": "John Doe",
      "profilePic": "assets/images/Avatar1.png",
    },
    {
      "name": "Jane Smith",
      "profilePic": "assets/images/Avatar2.png",
    },
    {
      "name": "Sushant Tuladhar",
      "profilePic": "assets/images/Sushant.jpg",
    },
    {
      "name": "Kanchan Babu Neupane",
      "profilePic": "assets/images/kanchan.jpeg",
    },
    {
      "name": "Alex Johnson",
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
                "Chats",
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
                  // Add your action for starting a new chat here
                },
                child: Image.asset(
                  "assets/images/add.png",
                  height: 45,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Stories Section
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 70, // Fixed width for each story
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          stories[index]["profilePic"]!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        stories[index]["name"]!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'mulish',
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          // Search Bar
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
                  hintText: 'Search Chats',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'mulish',
                    color: Color(0XFFADB5BD),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0XFFADB5BD),
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
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 20.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Chat List
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            chats[index]["profilePic"]!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          chats[index]["name"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'mulish',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          chats[index]["lastMessage"] ?? "No message available",
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'mulish',
                            color: Color.fromARGB(255, 186, 189, 192),
                          ),
                        ),
                        trailing: Text(
                          chats[index]["time"]!,
                          style: const TextStyle(
                            fontSize: 12,
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
