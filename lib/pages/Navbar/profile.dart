import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon:
                Icon(isDark ? CupertinoIcons.sunrise : CupertinoIcons.moon_zzz),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                      "data:image/png;base64,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"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "XYZ",
                style: Theme.of(context).textTheme.headline4,
              ),
              Text("xyz@gmail.com",
                  style: Theme.of(context).textTheme.headline2),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.black54),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      side: BorderSide.none,
                      shape: StadiumBorder()),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(),
              SizedBox(
                height: 30,
              ),
              // Menu
              MenuWidget(
                title: "Settings",
                icon: CupertinoIcons.settings,
                onPress: () {},
              ),
              MenuWidget(
                title: "Billing Details",
                icon: CupertinoIcons.bag,
                onPress: () {},
              ),
              MenuWidget(
                title: "User Management",
                icon: CupertinoIcons.profile_circled,
                onPress: () {},
              ),
              MenuWidget(
                title: "Information",
                icon: CupertinoIcons.settings,
                onPress: () {},
              ),
              MenuWidget(
                title: "Logout",
                icon: CupertinoIcons.settings,
                onPress: () {},
                endIcon: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onPress,
        leading: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blueAccent.withOpacity(0.1),
          ),
          child: Icon(
            CupertinoIcons.settings_solid,
            color: Colors.blueAccent,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        trailing: endIcon
            ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blueAccent.withOpacity(0.1),
                ),
                child: Icon(
                  icon,
                  size: 18.0,
                  color: Colors.grey,
                ),
              )
            : null);
  }
}
