// class User {
//   String id;
//   String email;
//   String displayName;
//   String userName;
//   String profilePic;
//   String contact;
//   String bio;
//   String location;
//   String createdAt;
//   bool isVerified;
//   int openClaims;
//   int totalItems;
//   int deliveries;
//   String fcmToken;
//   List<String> claimsList=[];
//   List<String> deliveryZipsList=[];
//   List<String> designsList;
//   List<String> updatesList;

//   User(
//       {     
//       this.id,
//       this.email,
//       this.displayName,
//       this.profilePic,
//       this.contact,
//       this.bio,
//       this.location,
//       this.createdAt,
//       this.userName,
//       this.openClaims,
//       this.isVerified,
//       this.fcmToken,
//       this.claimsList,
//       this.updatesList
//       });

//   User.fromJson(Map<dynamic, dynamic> map) {
//     if (map == null) {
//       return;
//     }

//    id = map['id'];
//     email = map['email'];
//     displayName = map['displayName'];
//     profilePic = map['profilePic'];
//     bio = map['bio'];
//     location = map['location'];
//     contact = map['contact'];
//     createdAt = map['createdAt'];
//     userName = map['userName'];
//     fcmToken = map['fcmToken'];
//     isVerified = map['isVerified'] ?? false;


//   }
//   toJson() {
//     return {
//       'id': id,
//       "email": email,
//       'displayName': displayName,
//       'profilePic': profilePic,
//       'contact': contact,
//       'bio': bio,
//       'location': location,
//       'createdAt': createdAt,
//       'userName': userName,
//       'isVerified': isVerified ?? false,
//       'fcmToken':fcmToken,
//     };
//   }

//   User copyWith(
//       {String email,
//       String userId,
//       String displayName,
//       String profilePic,
//       String key,
//       String contact,
//       bio,
//       String dob,
//       String location,
//       String createdAt,
//       String userName,
//       int followers,
//       int following,
//       String webSite,
//       bool isVerified,
//       String fcmToken,
//       List<String> followingList,
//       }) {
//     return User(
//         email: email ?? this.email,
//         bio: bio ?? this.bio,
//         contact: contact ?? this.contact,
//         createdAt: createdAt ?? this.createdAt,
//         displayName: displayName ?? this.displayName,
//         isVerified: isVerified ?? this.isVerified,
//         id: id ?? this.id,
//         location: location ?? this.location,
//         profilePic: profilePic ?? this.profilePic,
//         userName: userName ?? this.userName,
//         fcmToken:fcmToken ?? this.fcmToken,
//         );
//   }


// }
