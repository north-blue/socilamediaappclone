

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class DatabaseServices {
  //update for edit profile
  //userData
  //followers and followers
  //button to follow user
  //singnOut
  String? inituserName;
  String? inituserPhoto;
  String? inituserBio;

  void updateUserData(User user) {
    FirebaseFirestore.instance.collection('users').doc(user.uid).update({
      "profilePhoto": user.profilePhoto,
      "uid": user.uid,
      "bio": user.bio,
      //"username": user.username,
    });
  }



 





  Future initUserData(String userId) async {
    
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((doc) => {
              //document snapshot of current userdata

              inituserName = doc.data()!['username'],
              inituserBio = doc.data()!['bio'],
              inituserPhoto = doc.data()!['profilePhoto'],
            });
  }

//get data
  static Future<User> getUserSDataWithId(String userId) async {
    DocumentSnapshot userDocSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDocSnapshot.exists) {
      return User.fromDoc(userDocSnapshot);
    }
    return User();
  }

  static Future<int> numFollowing(String userId) async {
    QuerySnapshot followingSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('userFollowing')
        .get();
    return followingSnapshot.docs.length;
  }

  static Future<int> numFollowers(String userId) async {
    QuerySnapshot followersSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('userFollowers')
        .get();
    return followersSnapshot.docs.length;
  }

  static Future<bool> isFollowingUser(
      String currentUserId, String userId) async {
    DocumentSnapshot followingDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('userFollowers')
        .doc(currentUserId)
        .get();
    return followingDoc.exists;
  }

  static void followUser(String currentUserId, String userId) {
    //add user to current user's following collection
    //followersRef = _firestore.collection('followers');

    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserId)
        .collection('userFollowing')
        .doc(userId)
        .set({});

// Add current user to user's followers collection

    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('userFollowers')
        .doc(currentUserId)
        .set({});
  }

  static void unfollowUser(String currentUserId, String userId) {
    // Remove user from current user's following collection
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserId)
        .collection('userFollowing')
        .doc(userId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // Remove current user from user's followers collection
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('userFollowers')
        .doc(currentUserId)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
  }

//dont write this one when your makine actuall tutorial

  static Future<QuerySnapshot> searchUsers(String name) {
    Future<QuerySnapshot> users = FirebaseFirestore.instance
        .collection('users')
        .where('username', isGreaterThanOrEqualTo: name)
        .get();
    return users;
  }
}
