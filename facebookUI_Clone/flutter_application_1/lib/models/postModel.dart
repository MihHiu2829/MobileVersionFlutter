
class Post {
  final String? avatarUrl;
  final String? username;
  final String? time;
  final String? content;
  final String? likes;
  final String? comments;
  final String? images;
  final String? shares;

  Post({
     this.avatarUrl,
     this.username,
     this.time,
     this.content,
     this.images,
     this.likes,
     this.comments,
     this.shares,
  });
}


class Story {
  final String? storyBackground;
  final String? imageUser;
  final String? username;

  Story({
     this.storyBackground,
     this.imageUser,
     this.username,
   
  });
}

class AddFriend {
  final String? userName;
  final String? urlImage;
  final String? relevantFriendCapacity ;

  AddFriend({
     this.userName,
     this.urlImage,
     this.relevantFriendCapacity,
   
  });
}

class AcceptFriend {
   final String? userName;
  final String? urlImage;
  final String? relevantFriendCapacity ;
  final String? timeDetect ; 

  AcceptFriend({
     this.userName,
     this.urlImage,
     this.relevantFriendCapacity,
     this.timeDetect 
   
  });
}
class UserNotification {
   final String? imageUrl;
   final String? content;
   final String? time;

  UserNotification({
     this.imageUrl,
     this.content,
     this.time,
  });
}