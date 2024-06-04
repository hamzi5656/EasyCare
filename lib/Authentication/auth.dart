import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
 final _auth= FirebaseAuth.instance;
    Future <void> sendPasswordReset(String email) async{
    try{
await   _auth.sendPasswordResetEmail(email: email);

    }
    catch(e){
print(e.toString());
    }

   }
}