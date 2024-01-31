class NoteModel {
  String key;
  String title;
  String postedOn;

  NoteModel({
    required this.key,
    required this.title,
    required this.postedOn,
  });

  factory NoteModel.fromMap(String key, Map<dynamic, dynamic> map) {
    return NoteModel(
      key: key,
      title: map['title'] ?? '',
      postedOn: map['posted On'] ?? '',
    );
  }
}
