import 'package:clicknext_text/services/networking.dart';

class User {
  final int? id;
  final String? image;
  final String? username;
  final String? userGithubUrl;
  User({
    this.id,
    this.image,
    this.username,
    this.userGithubUrl,
  });

  static Future<List<User>?> users() async {
    NetworkHelper networkHelper = NetworkHelper();

    var json = await networkHelper.getData('https://api.github.com/users');

    List<User> users = [];
    for (Map u in json) {
      User user = User(
          id: u['id'],
          image: u['avatar_url'],
          username: u['login'],
          userGithubUrl: u['url']);
      users.add(user);
    }
    return users;
  }
  static Future<User?> repoUser(int id) async {
    NetworkHelper networkHelper = NetworkHelper();

    var json = await networkHelper.getData('https://api.github.com/users');

    //ทำการส่ง id เข้ามาเพื่อหา index เสร็จแล้วนำไป map จะได้ ีuserRow ออกมา
    var index;
    int i = 0;
    //หา array ที่ตรงกับ id และกำหนนด index
    for (Map u in json) {
      if (u['id'] == id) {
        index = i;
      }
      i += 1;
    }
    Map u = json[index];
    User userRow = User(
        id: u['id'],
        image: u['avatar_url'],
        username: u['login'],
        userGithubUrl: u['url']);
    return userRow;
  }
}
