import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../network/api_auth.dart';

class PhotoList extends StatelessWidget {
  const PhotoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FirebaseAuth.instance.currentUser!.email!),
        actions: const [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: AuthAPI.logout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: const Center(
        child: Text('Photo List'),
      ),
    );
  }
}
