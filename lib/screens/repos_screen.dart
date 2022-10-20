import 'package:clicknext_text/class/color_title.dart';
import 'package:clicknext_text/main.dart';
import 'package:clicknext_text/model/repos.dart';
import 'package:clicknext_text/model/users.dart';
import 'package:flutter/material.dart';

class RepoScreen extends StatefulWidget {
  final List<Repo>? repos;
  final User? userRow;
  RepoScreen({this.repos, this.userRow});

  @override
  _RepoScreenState createState() => _RepoScreenState();
}

class _RepoScreenState extends State<RepoScreen> {
  List<Repo> repos = [];
  User userRow = User();
  //เรียกใช้ class สี
  Colorlist col = Colorlist();
  //ใช้ในการทำให้ list สลับสีกัน
  int countloop = 0; //ใช้นับจำนวน loop
  int checkloop = 0; //ใช้เช็คจำนวน loop

  List<ListTile> getListTile() {
    List<ListTile> list = [];
    //เริ่มต้มด้วย countloop เป็น 0 เพื่อเป็นการเซ็ทค่าเริ่มต้น
    countloop = 0;
    for (var repo in repos) {
      countloop += 1;
      checkloop = countloop % 2;
      var l = ListTile(
        title: Text("${repo.name}", style: f.fontAll()),
        subtitle: Text("${repo.repoUrl}", style: f.fontAll()),
        tileColor: col.colortitle(checkloop),
      );
      list.add(l);
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    repos = (widget.repos ?? []).toList();
    userRow = (widget.userRow)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Repositories", style: f.fontAll()),
                  CircleAvatar(
                    backgroundImage: NetworkImage("${userRow.image}"),
                  ),
                ],
              )
            ],
          ),
          backgroundColor: Colors.blueAccent[100],
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                flex: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: Column(
                    children: [
                      Text("User Name: ${userRow.username}", style: f.fontAll()),
                      Text(userRow.userGithubUrl!, style: f.fontAll())
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView(
                children: getListTile(),
              ))
            ],
          ),
        ));
  }
}
