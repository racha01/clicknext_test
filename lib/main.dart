import 'package:clicknext_text/class/font.dart';
import 'package:clicknext_text/model/users.dart';
import 'package:clicknext_text/screens/user_screens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nice_buttons/nice_buttons.dart';

void main() async => runApp(MyApp());

Future<List<User>?> users = User.users();
FontClickNext f = FontClickNext();

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Http',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: f.fontAll(),),
        backgroundColor: Colors.blueAccent[900],
      ),
      body: Center(
        child: NiceButtons(
          stretch: false,
          startColor: Colors.amber,
          endColor: Colors.amber,
          borderColor: Colors.black,
          gradientOrientation: GradientOrientation.Vertical,
          onTap: (finish) async {
            List<User>? users = await User.users();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserScreen(
                    users: users,
                  ),
                ));
          },
          child: Text(
            'Start',
            style: GoogleFonts.barlowCondensed(textStyle: TextStyle(fontSize: 30)),
          ),
        ),
      ),
    );
  }
}
