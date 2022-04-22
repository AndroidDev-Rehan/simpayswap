
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseService
{
  Future<void> setVerificationKey(String id)async
  { try {
    final ref = await FirebaseDatabase.instance.ref("users");
    await ref.child(FirebaseAuth.instance.currentUser!.uid)
        .child("secretKey")
        .set(id);
  }catch(e)
    {
      Fluttertoast.showToast(msg: e.toString());
    }

  }
}