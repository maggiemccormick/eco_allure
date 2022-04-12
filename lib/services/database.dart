import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_allure/models/brand.dart';

class DatabaseService {

  // collection reference
  final CollectionReference brandCollection = FirebaseFirestore.instance.collection('products');

  // product list from snapshot
  List<Brand> _productListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Brand(
        title: doc.get('title') ?? '',
        cat: doc.get('cat') ?? '',
        rating: doc.get('rating') ?? '',
        imagePath: doc.get('imagePath') ?? '',
        ingredients: doc.get('ingredients') ?? '',
        sustainability: doc.get('sustainability') ?? '',
        animalRights: doc.get('animalRights') ?? '',
      );
    }).toList();
  }

  // get products stream
  Stream<List<Brand>> get products {
    return brandCollection.snapshots()
      .map(_productListFromSnapshot);
  }

  // final skinRef = FirebaseFirestore.instance.collection('products').withConverter<Product>(
  //   brandCollection.where('cat', isEqualTo: 'skincare').get();
  // );

  // Future<void> main() async {
  //   List<QueryDocumentSnapshot<Product>> skincareProducts = await brandCollection
  //       .where('cat', isEqualTo: 'skincare')
  //       .get()
  //       .then((snapshot) => snapshot.docs);
  // }
}