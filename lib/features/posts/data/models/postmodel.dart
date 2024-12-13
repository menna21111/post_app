import '../../domain/entites/post.dart';

class Postmodel extends Post{
  final int id;
  final int userid;
  final String title;
  final String body;

  Postmodel( {required this.userid,required this.id, required this.title, required this.body}) : super(id: id, title: title, body: body, userid: userid);
   factory Postmodel.fromJson(Map<String,dynamic>json){
     return Postmodel(id: json['id'], title: json['title'], body: json['body'],userid: json['userId']);
   }
   Map <String,dynamic>toJson(){
     return {'id': id, 'title': title, 'body': body};
   }
}