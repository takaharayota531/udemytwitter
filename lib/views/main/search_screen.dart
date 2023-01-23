import 'package:flutter/material.dart';
//constants
import 'package:udemypractice/constants/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemypractice/domain/firestore_user/firestore_user.dart';
import 'package:udemypractice/views/main/search_model.dart';
import 'package:udemypractice/constants/routes.dart' as routes;

class SearchScreen extends ConsumerWidget {
  SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SearchModel searchModel = ref.watch(searchProvider);
    return ListView.builder(
        itemCount: searchModel.users.length,
        itemBuilder: ((context, index) {
          final FirestoreUser firestoreUser = searchModel.users[index];
          return ListTile(
            title: Text(firestoreUser.uid + ":" + firestoreUser.userName),
            onTap: () => routes.toPassiveUserProfilePage(
                context: context, passiveFirestoreUser: firestoreUser),
          );
        }));
  }
}
