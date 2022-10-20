
import 'package:clicknext_text/services/networking.dart';

class Repo {
  final int? id;
  final String? name;
  final String? repoUrl;
  Repo({
    this.id,
    this.name,
    this.repoUrl,
  });
  static  Future<List<Repo>?> repos(String username) async {
    String  url = "https://api.github.com/users/" + username + "/repos";

    NetworkHelper networkHelper = NetworkHelper();
    
    var json = await networkHelper.getData(url);

    List<Repo> repos = [];
    for (Map r in json) {
      Repo repo = Repo(
          id: r['id'],
          name: r['name'],
          repoUrl: r['html_url']);
      repos.add(repo);
    }
    return repos;
  }
}