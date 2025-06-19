import 'package:hive/hive.dart';

part 'add_post_model.g.dart';

@HiveType(typeId: 0)
class Post extends HiveObject {

  @HiveField(0)
  String nama;

  @HiveField(1)
  String caption;
  
  @HiveField(2)
  bool like;

  Post({
    required this.nama,
    required this.caption,
    this.like = false,
  });
}