import 'user_bean.dart';

/// imageid : "264237719"
/// videoUrl : null
/// materials : "玉米渣,大米,枸杞"
/// name : "玉米渣粥"
/// description : "玉米渣可以用来煮饭和煲粥，具有通便、护眼、降压降脂、补脑的功效。"
/// recommend : ""
/// id : "264237722"
/// user : {"imageid":"264065389","star":0,"profile":"请添加您的个人简介","nickname":"薯条沾腐乳","signed":0,"id":"263277981","type":"Rookie"}
/// infos : {"hasVideo":false,"grade":"1","collectionCount":41,"exclusive":0,"likeCount":37,"viewCount":668,"isrec":"4"}
/// status : 1

class Recipe {
  String imageid;
  dynamic videoUrl;
  String materials;
  String name;
  String description;
  String recommend;
  String id;
  User user;
  InfosBean infos;
  int status;
  bool isCollected = false;


  Recipe.name(this.name);


  Recipe();

  static Recipe fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Recipe listBean = Recipe();
    listBean.imageid = map['imageid'];
    listBean.videoUrl = map['videoUrl'];
    listBean.materials = map['materials'];
    listBean.name = map['name'];
    listBean.description = map['description'];
    listBean.recommend = map['recommend'];
    listBean.id = map['id'];
    listBean.user = User.fromMap(map['user']);
    listBean.infos = InfosBean.fromMap(map['infos']);
    listBean.status = map['status'];
    return listBean;
  }

  Map toJson() => {
        "imageid": imageid,
        "videoUrl": videoUrl,
        "materials": materials,
        "name": name,
        "description": description,
        "recommend": recommend,
        "id": id,
        "user": user,
        "infos": infos,
        "status": status,
      };
}

/// hasVideo : false
/// grade : "1"
/// collectionCount : 41
/// exclusive : 0
/// likeCount : 37
/// viewCount : 668
/// isrec : "4"
class InfosBean {
  bool hasVideo;
  String grade;
  int collectionCount;
  int exclusive;
  int likeCount;
  int viewCount;
  String isrec;

  static InfosBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    InfosBean infosBean = InfosBean();
    infosBean.hasVideo = map['hasVideo'];
    infosBean.grade = map['grade'];
    infosBean.collectionCount = map['collectionCount'];
    infosBean.exclusive = map['exclusive'];
    infosBean.likeCount = map['likeCount'];
    infosBean.viewCount = map['viewCount'];
    infosBean.isrec = map['isrec'];
    return infosBean;
  }

  Map toJson() => {
        "hasVideo": hasVideo,
        "grade": grade,
        "collectionCount": collectionCount,
        "exclusive": exclusive,
        "likeCount": likeCount,
        "viewCount": viewCount,
        "isrec": isrec,
      };
}
