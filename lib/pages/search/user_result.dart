
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socilamedia_one_flutter/model/user.dart';
import 'package:socilamedia_one_flutter/pages/profile/profileui.dart';


class UserResult extends StatelessWidget {
  final User user;

  UserResult(this.user);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          color: Theme.of(context).primaryColor.withOpacity(0.7),
          child: Column(
            children: <Widget>[
              GestureDetector(
               // onTap: () => showsearchProfile(context, profileId: user.id),
               onTap: () => SnackBar(content:Text('User is clicked') ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: CachedNetworkImageProvider(user.profilePhoto.toString()),
                  ),
                  title: Text(
                    user.username.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    user.username.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Divider(
                height: 2.0,
                color: Colors.white54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
