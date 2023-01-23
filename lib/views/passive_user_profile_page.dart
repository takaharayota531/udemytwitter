import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemypractice/domain/firestore_user/firestore_user.dart';

class PassiveUserProfilePage extends ConsumerWidget {
  PassiveUserProfilePage({
    Key? key,
    required this.passiveFirestoreUser,
  }) : super(key: key);

  final FirestoreUser passiveFirestoreUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(passiveFirestoreUser.uid),
          Text(passiveFirestoreUser.userName),
        ],
      ),
    );
  }
}
