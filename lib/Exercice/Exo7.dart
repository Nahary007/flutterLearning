import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isFollowing = false;
  @override
  Widget build(BuildContext context){
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    final profileContent = [
      CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('assets/images/article.jpeg'),
      ),
      const SizedBox(height: 16, width: 16,),
      const Text(
          'Nahary',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16, width: 16,),
      GestureDetector(
        onTap: () {
          setState(() {
            isFollowing = !isFollowing;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: isFollowing ? Colors.green : Colors.blue,
            borderRadius: BorderRadiusGeometry.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child,),
              child: Text(
                isFollowing ? 'Suivi ' : 'Suivre',
                key: ValueKey<bool>(isFollowing),
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
          ),
        ),
      )
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Profil Animé'),),
      body: Center(
        child: isPortrait ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: profileContent,
        ) :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: profileContent,
            )
      ),
    );
  }

}