import 'package:cloud_firestore/cloud_firestore.dart';

create() async {
  await FirebaseFirestore.instance
      .collection('pets')
      .doc('regan')
      .set({'name': 'jack', 'animal': 'monkey', 'age': '5'});
  print("data set to fire store");
}

update(String colnam, doc, filename, var newvalue) async {
  await FirebaseFirestore.instance
      .collection(colnam)
      .doc(doc)
      .update({filename: newvalue});

  print("updated");
}

retrive(String colnam, doc) async {
  await FirebaseFirestore.instance
      .collection(colnam)
      .doc(doc)
      .get()
      .then((doc) {
    if (doc.exists) {
      print(doc.data());
    }
  });
}

delete(String colnam, doc) async {
  FirebaseFirestore.instance.collection(colnam).doc(doc).delete().then((_) {
    print('Document deleted successfully');
  }).catchError((error) {
    print('Failed to delete document: $error');
  });
}
