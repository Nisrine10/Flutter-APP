import 'package:aeapp/material/string.dart';
import 'package:aeapp/models/video.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController{
  _compressVideo(String videoPath) async {
    final compressVideo = await VideoCompress.compressVideo(videoPath,quality:VideoQuality.MediumQuality);
    return compressVideo!.file;
  }

  Future <String> _uploadVideoToStorage(String id,String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);

    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }


  _getImage(String videoPath) async {
    final Image = await VideoCompress.getFileThumbnail(videoPath);
    return Image;
  }

  Future<String> _uploadImageToStorage(String id,String videoPath) async {
    Reference ref = firebaseStorage.ref().child('Image').child(id);

    UploadTask uploadTask = ref.putFile(await _getImage(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;

  }

  uploadVideo(String songName,String caption,String videoPath) async {
    try{
      String uid = firebaseAuth.currentUser!.uid;

      DocumentSnapshot userDoc = await firestore.collection('users').doc(uid).get();

      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;

      String videoUrl = await _uploadVideoToStorage("video $len",videoPath);
      String image = await _uploadImageToStorage("Video $len",videoPath);

      Video video = Video(username:(userDoc.data()! as Map <String , dynamic>)['name'] , uid: uid, id: "Video $len", caption: caption, songname: songName, videoURL: videoUrl, image: image, profilePhoto:(userDoc.data()! as Map <String , dynamic>)['profilePhoto'], likes: [], commentCount: 0, shareCount: 0);
      await firestore.collection('videos').doc('Video $len').set(video.toJson());
      Get.back();

    }catch(e){
      Get.snackbar('Error Uploadung Video', e.toString());
      print(e.toString());
    }
  }
}