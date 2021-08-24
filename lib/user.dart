class LoginUser {
  String uid;
  String? displayName;
  String? photoUrl;
  String? email;
  String phoneNumber;

  LoginUser({
    required this.uid,
    this.photoUrl,
    this.displayName,
    this.email,
    required this.phoneNumber,
  });
}
