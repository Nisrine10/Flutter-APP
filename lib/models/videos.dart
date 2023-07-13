class Videos {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;

  Videos({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.channelTitle,
  });

  factory Videos.fromMap(Map<String, dynamic> snippet) {
    return Videos(
      id: snippet['resourceId']['videoId'],
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
      channelTitle: snippet['channelTitle'],
    );
  }
}