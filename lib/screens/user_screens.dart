import 'package:clicknext_text/class/color_title.dart';
import 'package:clicknext_text/main.dart';
import 'package:clicknext_text/model/repos.dart';
import 'package:clicknext_text/model/users.dart';
import 'package:clicknext_text/screens/repos_screen.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  final List<User>? users;
  UserScreen({this.users});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<User> users = [];
  //เรียกใช้ class สี
  Colorlist col = Colorlist();
  //ใช้ในการทำให้ list สลับสีกัน
  int countloop = 0; //ใช้นับจำนวน loop
  int checkloop = 0; //ใช้เช็คจำนวน loop

  List<ListTile> getListTile() {
    List<ListTile> list = [];
    //เริ่มต้มด้วย countloop เป็น 0 เพื่อเป็นการเซ็ทค่าเริ่มต้น
    countloop = 0;
    for (var user in users) {
      countloop += 1;
      checkloop = countloop % 2;
      var l = ListTile(
        title: Wrap(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("${user.image}"),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("${user.username}", style: f.fontAll(),)
              ],
            )
          ],
        ),
        subtitle: Text("${user.userGithubUrl}", style: f.fontAll(),),
        onTap: () async {
          List<Repo>? repos = await Repo.repos(user.username!);
          User? userRow = await User.repoUser(user.id!);

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RepoScreen(
                  repos: repos,
                  userRow: userRow,
                ),
              ));
        },
        tileColor: col.colortitle(checkloop),
      );
      list.add(l);
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    users = (widget.users ?? []).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("User Github", style: f.fontAll()),
          backgroundColor: Colors.blueAccent[500],
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: getListTile(),
              ))
            ],
          ),
        )
        );
  }
}
