import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/home_screen/widgets/heart_icon.dart';
import 'package:profile/home_screen/widgets/personal_information.dart';
import 'package:profile/home_screen/widgets/skills.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.toggleTheme, required this.iconDataTheme});
  final Function() toggleTheme;
  final IconData iconDataTheme;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(CupertinoIcons.chat_bubble_text_fill),
          const SizedBox(width: 16),
          InkWell(
            onTap: widget.toggleTheme,
            child: Icon(widget.iconDataTheme),
          ),
          const SizedBox(width: 16),
        ],
        title: const Text('Curriculum Vitae'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/profile_image.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Brice Séraphin',
                          style: theme.titleMedium,
                        ),
                        const Text('Product& Product Designer'),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location_solid,
                              size: 16,
                              color: theme.bodySmall!.color,
                            ),
                            Text('Paris, France', style: theme.bodySmall),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const HeartIcon(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32, left: 32, bottom: 16),
              child: Text(
                'Enthusiastic young computer Geek, Freelance Designer in love of independence, I have alot of experience in graphical projects, and always give the best of myself to bring you to success.',
                style: theme.bodySmall,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 16, bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Skills',
                    style: theme.titleMedium!.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const Icon(CupertinoIcons.chevron_down, size: 12),
                ],
              ),
            ),
            const Skills(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 16, bottom: 16),
              child: Text(
                'Personal Information',
                style: theme.titleMedium!.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            const InformationUser(),
          ],
        ),
      ),
    );
  }
}
