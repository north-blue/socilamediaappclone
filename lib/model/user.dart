import 'package:cloud_firestore/cloud_firestore.dart';

class User {
   String?  profilePhoto; //save as string not file type because we are saving the download url
 String? email;
  String? uid;
   String? bio;
  String? username;

  User(
      {  this.email,
       this.uid,
       this.profilePhoto,
     this.bio,
   this.username});

  Map<String, dynamic> toJson() => {
        //method will convert our model data in map

        "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
        "bio": bio,

        "username": username,
      };



//this if giving error for profile logic
  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
      email: doc['email'],
      profilePhoto: doc['profilePhoto'],
      uid: doc['uid'],
      bio: doc['bio'],
      username: doc['username'],
    );
  }


  
  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
    email: doc['email'],
      profilePhoto: doc['profilePhoto'],
      uid: doc['uid'],
      bio: doc['bio'],
      username: doc['username'],
    );
  }


   static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      bio: snapshot['bio'],
      username: snapshot['username'],
    );
  }

/*
  Map<String, dynamic> toJson() => {
        //method will convert our model data in map

        "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
        "bio": bio,

        "username": username,
      };

  //this method basically take the DocumentSnapshot which we will pass in future while deals with value
  //then it will convert in model
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      bio: snapshot['bio'],
      username: snapshot['username'],
    );
  }
  */

}
