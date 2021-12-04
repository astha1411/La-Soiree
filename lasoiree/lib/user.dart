// class User {
//   final String uid;
//   final String phone;
//   final String name;

//   User({required this.uid, required this.name, required this.phone});


//   User.fromData(Map<String, dynamic> data)
//       : id = data['id'],
//         fullName = data['fullName'],
//         email = data['email'],
//         userRole = data['userRole'];
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'fullName': fullName,
//       'email': email,
//       'userRole': userRole,
//     };
//   }

//   //take data from server
//   factory User.fromMap() {
//     return User(uid: map['uid'], name: map['uid'], phone: map['phone']);
//   }
// }
