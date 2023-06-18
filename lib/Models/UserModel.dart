class UserModel {
  String? uid;
  String? fullname;
  String? profilepic;
  String? email;

  UserModel({this.profilepic, this.email, this.fullname, this.uid});
  //
  UserModel.toObject(Map<String, dynamic> map) {
    uid = map["uid"];
    profilepic = map["profilepic"];
    fullname = map["fullname"];
    email = map["email"];
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "fullname": fullname,
      "email": email,
      "profilepic": profilepic,
    };
  }
}
