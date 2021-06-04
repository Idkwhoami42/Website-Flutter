import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  Widget imagebutton(logo, url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: SvgPicture.asset(logo, color: Colors.white, height: 42),
        onTap: () async {
          _launchURL(url);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181818),
      body: Center(
        child: Column(
          children: [
            Spacer(flex: 42),
            Text(
              "Neel Lodha",
              style: GoogleFonts.exo(
                fontSize: 69,
                color: Color(0xff17b8bd),
              ),
            ),
            Row(
              children: [
                Spacer(flex: 4),
                imagebutton(
                    'assets/githubicon.svg', 'https://github.com/Glitched15'),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 24),
                  child: SvgPicture.asset('assets/discordicon.svg',
                      color: Colors.white, height: 42),
                ),
                imagebutton(
                    'assets/magicicon.svg', 'https://youtu.be/dQw4w9WgXcQ'),
                Spacer(flex: 4),
              ],
            ),
            Spacer(flex: 69),
          ],
        ),
      ),
    );
  }
}
