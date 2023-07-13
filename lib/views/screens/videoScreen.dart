import 'package:aeapp/controllers/video_controller.dart';
import 'package:aeapp/material/colors.dart';
import 'package:aeapp/material/string.dart';
import 'package:aeapp/views/screens/videoPlayer.dart';
import 'package:aeapp/views/widgets/circle_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key}) : super(key: key);
  final VideoController videoController = Get.put(VideoController());
  buildProfile(String profilePhoto){
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            left: 5,
            child: Container(
              height: 50,
              width: 50,
              padding:const EdgeInsets.all(1),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                    image:NetworkImage(profilePhoto),
                    fit: BoxFit.cover,

                ),
              ),
          ),

          )
        ],
      ),
    );
  }

  buildMusicAlbum(String profilePhoto){
    return SizedBox(width: 60,height: 60,child:
    Column(
      children: [
        Container(
          padding: EdgeInsets.all(11),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.grey,Colors.white]),
            borderRadius: BorderRadius.circular(25)),
            child:ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(image: NetworkImage(profilePhoto),
              ),
            )
          ),

      ],
    ),);
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Obx(() {
          return PageView.builder(

              controller: PageController(initialPage: 0,viewportFraction: 1),
              itemCount:videoController.videoList.length ,
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index){
                final data = videoController.videoList[index];
                return Stack(
                  children: [
                    Center(child: VideoPlayerItem(videoUrl:data.videoURL ,)),
                    Column(
                      children: [
                        const SizedBox(height: 100,),
                      Expanded(
                        child:Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(child: Container(
                              padding: const EdgeInsets.only(left:20 ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                
                                children: [
                                  Text(data.username,style: const TextStyle(fontSize:20,color: Colors.white,fontWeight: FontWeight.bold ),),
                                  Text(data.caption,style: const TextStyle(fontSize:20,color: Colors.white,fontWeight: FontWeight.bold ),),
                                  Row(
                                    children: [
                                      const Icon(Icons.music_note,size: 30,color:Colors.white,),
                                      Text(data.songname,style: const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                  SizedBox(height: 30,)
                                ],
                              ),),),
                            Container(
                              width: 100,
                              margin:EdgeInsets.only(top: size.height/3),
                              child: Column(

                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  buildProfile(data.profilePhoto),
                                  Column(

                                    children: [
                                      InkWell(
                                          onTap: () => videoController.likeVideo(data.id),
                                          child: Icon(Icons.favorite,size: 30,color: data.likes.contains(authController.user.uid) ?Colors.red:Colors.white,)
                                      ),
                                      SizedBox(height: 6,),
                                      Text(data.likes.length.toString(),style: TextStyle(fontSize: 10,color: Colors.white),),
                                      InkWell(
                                          onTap: (){},
                                          child: Icon(Icons.comment,size: 30,color: Colors.white,)
                                      ),
                                      SizedBox(height: 6,),
                                      Text(data.commentCount.toString(),style: TextStyle(fontSize: 10,color: Colors.white),),
                                      InkWell(
                                          onTap: (){},
                                          child: Icon(Icons.send_rounded,size: 30,color: Colors.white,)
                                      ),
                                      SizedBox(height: 6,),
                                      Text(data.shareCount.toString(),style: TextStyle(fontSize: 10,color: Colors.white),),
                                      CircleAnimation(child:buildMusicAlbum(data.profilePhoto)),
                                      SizedBox(height: 20,)
                                    ],
                                  )
                                ],

                              ),
                            )
                          ],

                        )
                      )
                      ],
                    )
                  ],
                );
              });
        }
      ),
    );
  }
}
