import 'package:flutter_application_1/models/postModel.dart';

class MockUpAcceptFriendsList  {
  static List<AcceptFriend> acceptFriends = [
    AcceptFriend(userName: "Leo Trần", urlImage: 'assets/addFriends01.jpg',relevantFriendCapacity: "29"),
    AcceptFriend(userName: "Bành Thanh Sơn", urlImage: 'assets/addFriends02.jpg',relevantFriendCapacity: "12"),
    AcceptFriend(userName: "Trần Quỳnh Anh", urlImage: 'assets/addFriends03.jpg',relevantFriendCapacity: "22"),
    AcceptFriend(userName: "Hải Ngân", urlImage: 'assets/addFriends04.jpg',relevantFriendCapacity: "24"),
    AcceptFriend(userName: "Trần Thư", urlImage: 'assets/addFriends05.jpg',relevantFriendCapacity: "92"),
  ];

   static List<AcceptFriend> acceptFriends02 = [ // đã kết bạn chờ act
    AcceptFriend(userName: "Ngọc Quyên", urlImage: 'assets/ava1.jpg'  ,timeDetect: "1 phút trước" ,relevantFriendCapacity: "21"),
    AcceptFriend(userName: "Diễm Quyên", urlImage: 'assets/ava2.jpg',timeDetect: "3 ngày trước",relevantFriendCapacity: "22"),
    AcceptFriend(userName: "Gia Linh", urlImage: 'assets/ava3.jpg',timeDetect: "2 năm trước",relevantFriendCapacity: "12"),
    AcceptFriend(userName: "Minh Hiếu", urlImage: 'assets/ava4.jpg',timeDetect: "1 tuần trước",relevantFriendCapacity: "32"),
    AcceptFriend(userName: "Minh Phan", urlImage: 'assets/ava5.jpg',timeDetect: "14 phút trước",relevantFriendCapacity: "21"),
  ];
}