import 'firebase_key.dart';

class Constants {
  static const BASE_API_URL =
      'https://groupexpenses-lucasbianco.firebaseio.com';

  static const BASE_AUTH_SIGNUP_URL =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${FirebaseKey.API_KEY}';

  static const BASE_AUTH_SIGNIN_URL =
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${FirebaseKey.API_KEY}';
}
