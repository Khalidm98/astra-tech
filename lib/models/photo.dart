import 'package:firebase_storage/firebase_storage.dart';

class Photo {
  String? name;
  String? url;
  DateTime? created;

  Photo({this.name, this.url, this.created});

  static Future<Photo> fromRef({required Reference ref}) async {
    return Photo(
      name: ref.name,
      url: await ref.getDownloadURL(),
      created: (await ref.getMetadata()).timeCreated,
    );
  }
}
