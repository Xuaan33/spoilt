import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> checkUserExists(String uid) async {
    try {
      DocumentSnapshot userSnapshot =
          await _firestore.collection('Users').doc(uid).get();

      if (userSnapshot.exists) {
        // Check if the user document has the required profile fields
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;
        bool profileFieldsEmptyOrNull =
            userData.values.any((value) => value == null || value == '');

        return true;
      } else {
        return false;
      }
    } catch (e) {
      // Handle any errors that occur during the process
      print('Error checking user existence: $e');
      return false;
    }
  }

  Future<void> addUser(String userId, Map<String, dynamic> userData) async {
    try {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('Users');

      print('Writing user data to Firestore: $userData');
      await usersCollection.doc(userId).set(userData);
      print('User data written successfully');
    } on FirebaseException catch (e) {
      print("Firebase Exception: $e");
      // Handle specific Firebase exceptions here
    } catch (e) {
      print("Error adding user: $e");
      // Handle other exceptions here
    }
  }
}
