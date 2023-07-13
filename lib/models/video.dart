import 'package:cloud_firestore/cloud_firestore.dart';

class Video{
  String username;
  String uid;
  String id;
  String caption;
  String songname;
  String videoURL;
  String image;
  String profilePhoto;
  List likes;
  int commentCount;
  int shareCount;

  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.caption,
    required this.songname,
    required this.videoURL,
    required this.image,
    required this.profilePhoto,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
});

  Map<String,dynamic> toJson() =>{
    "username":username,
    "uid":uid,
    "id":id,
    "caption":caption,
    "songname":songname,
    "videoURL":videoURL,
    "image":image,
    "profilePhoto":profilePhoto,
    "likes":likes,
    "commentCount":commentCount,
    "shareCount":shareCount,
  };

  static Video fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String,dynamic>;
    return Video(username: snapshot['username'],
        uid: snapshot['uid'],
        id: snapshot['id'],
        caption: snapshot['caption'],
        songname: snapshot['songname'],
        videoURL: snapshot['videoURL'],
        image: snapshot['image'],
        profilePhoto: snapshot['profilePhoto'],
        likes: snapshot['likes'],
        commentCount: snapshot['commentCount'],
        shareCount: snapshot['shareCount']);
  }
}