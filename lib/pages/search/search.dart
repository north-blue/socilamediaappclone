import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socilamedia_one_flutter/constant/constant.dart';

import 'package:socilamedia_one_flutter/model/user.dart';
import 'package:socilamedia_one_flutter/pages/search/user_result.dart';



class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  Future<QuerySnapshot>? searchResultsFuture;

  @override
  void initState() {
    super.initState();
  }

  handleSearch(String query) {
    Future<QuerySnapshot> users = FirebaseFirestore.instance
        .collection('users')
        .where("username", isGreaterThanOrEqualTo: query)
        .get();
    setState(() {
      searchResultsFuture = users;
    });
  }



  clearSearch() {
    searchController.clear();
  }

  buildSearchResults() {
    return FutureBuilder(
      future: searchResultsFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator(
            color: Colors.black,
          );
        }
        List<UserResult> searchResults = [];

        snapshot.data?.docs.forEach((doc) {
          //model= firebaseuser.fromdoc
          User user = User.fromDoc(doc);
          UserResult serachresult = UserResult(user);
          searchResults.add(serachresult);
        });

        return ListView(
          children: searchResults,
        );
      },
    );
  }

  Container buildNoContent() {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: const <Widget>[
            Text(
              "Find Users",
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                 searchToolBarColor,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
                fontSize: 40.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, //to hide the  appbar belove line
        backgroundColor: backgroundColor,
        title: SizedBox(
            height: 48,
            child: TextFormField(
              controller: searchController,
              onFieldSubmitted: handleSearch,
              decoration: InputDecoration(
                hintText: "Search users",
                filled: true,
                fillColor: searchToolBarColor,
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: const Icon(
                  Icons.search,
                  color: titleTextColor,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: clearSearch,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none),
                hintStyle: const TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 107, 106, 106)),
              ),
            )),
      ),
      body:
          searchResultsFuture == null ? buildNoContent() : buildSearchResults(),
    );
  }
}
