class Art {
  final String id;
  final String title;
  final String date;
  final String author;
  final String primaryImage;
  final String primaryImageSmall;

  //final List<String> tags;

  const Art(this.id, this.title, this.date, this.author, this.primaryImage,
      this.primaryImageSmall);

  factory Art.fromJson(Map<String, dynamic> js) {
    return Art(
        js["objectID"].toString(),
        js["title"] as String,
        js['objectDate'] as String,
        js['artistDisplayName'] as String,
        js["primaryImage"] as String,
        js["primaryImageSmall"] as String);
  }
}
