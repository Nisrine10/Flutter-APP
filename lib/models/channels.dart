class Chan{

  String channelid;
  String title;
  String thumbnails;




  Chan({required this.channelid,required this.title,required this.thumbnails});

  factory Chan.fromJson(Map<String,dynamic> json){

    return Chan(channelid: json['id']['channelId'],title: json['snippet']['title'],thumbnails: json['snippet']['thumbnails']['default']['url']);
  }

}