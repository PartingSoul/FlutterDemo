/// imageid : "264065389"
/// star : 0
/// profile : "请添加您的个人简介"
/// nickname : "薯条沾腐乳"
/// signed : 0
/// id : "263277981"
/// type : "Rookie"

class User {
  String imageid;
  int star;
  String profile;
  String nickname;
  int signed;
  String id;
  String type;

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    User userBean = User();
    userBean.imageid = map['imageid'];
    userBean.star = map['star'];
    userBean.profile = map['profile'];
    userBean.nickname = map['nickname'];
    userBean.signed = map['signed'];
    userBean.id = map['id'];
    userBean.type = map['type'];
    return userBean;
  }

  Map toJson() => {
        "imageid": imageid,
        "star": star,
        "profile": profile,
        "nickname": nickname,
        "signed": signed,
        "id": id,
        "type": type,
      };
}
