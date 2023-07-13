import 'package:aeapp/controllers/search_controller.dart';
import 'package:aeapp/material/colors.dart';
import 'package:aeapp/models/user.dart';
import 'package:aeapp/views/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final SearchControllers searchController =  Get.put(SearchControllers());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          backgroundColor: buttonColor,
          title: TextFormField(
            decoration: const InputDecoration(
              filled: false,
              hintText: 'Search',
              hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onFieldSubmitted: (value) => searchController.searchUser(value),
          ),
        ),
        body: searchController.searchedUsers.isEmpty
            ? const Center(
          child: Text(
            'Search for users!',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
            : ListView.builder(
          itemCount: searchController.searchedUsers.length,
          itemBuilder: (context, index) {
            User user = searchController.searchedUsers[index];
            return InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(uid: user.uid),
                ),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    user.profilePhoto,
                  ),
                ),
                title: Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}