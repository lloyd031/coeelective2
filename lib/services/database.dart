import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sweetncolours/models/user.dart';
class DatabaseService
{
  final String? uid;
  final String? email;
  DatabaseService(this.uid,this. email);

  //collection reference
  final CollectionReference accountDetails =FirebaseFirestore.instance.collection('acc');
  Future updateUserData(String fn, String ln,String profile) async{
    return await accountDetails.doc(uid).set({
      'fn':fn,
      'ln':ln,
      'profile':profile,
    });
  }
  //get accounts stream
  Stream<UserData?> get userData
  {
      return accountDetails.doc(uid).snapshots().map(_userDataFromSnapshot);  
  }
  //
  UserData? _userDataFromSnapshot(DocumentSnapshot snapshot)
  {
    
    return UserData(uid, snapshot.get("fn"), snapshot.get("ln"), snapshot.get("profile"),email);
  }
}