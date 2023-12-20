import 'package:flutter/material.dart';

enum Skill { photoshop, xd, illustrator, afterEffect, lightroom }

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  bool isActive = false;
  Skill skill = Skill.photoshop;
  // updateSelectItem(Skill skill) {
  //   setState(() {
  //     skill = skill;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 24),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          SkillBox(
            onTap: () {
              setState(() {
                skill = Skill.photoshop;
              });
            },
            isActive: skill == Skill.photoshop ? true : false,
            skill: Skill.photoshop,
            image: 'assets/images/app_icon_01.png',
            title: 'Photoshop',
            color: Colors.blue,
          ),
          SkillBox(
            onTap: () {
              setState(() {
                skill = Skill.xd;
              });
            },
            isActive: skill == Skill.xd ? true : false,
            skill: Skill.xd,
            image: 'assets/images/app_icon_05.png',
            title: 'Adobe XD',
            color: Colors.purpleAccent,
          ),
          SkillBox(
            onTap: () {
              setState(() {
                skill = Skill.illustrator;
              });
            },
            isActive: skill == Skill.illustrator ? true : false,
            skill: Skill.illustrator,
            image: 'assets/images/app_icon_04.png',
            title: 'Illustrator',
            color: Colors.orangeAccent,
          ),
          SkillBox(
            onTap: () {
              setState(() {
                skill = Skill.afterEffect;
              });
            },
            isActive: skill == Skill.afterEffect ? true : false,
            skill: Skill.afterEffect,
            image: 'assets/images/app_icon_03.png',
            title: 'After Effect',
            color: Colors.deepPurpleAccent,
          ),
          SkillBox(
            onTap: () {
              setState(() {
                skill = Skill.lightroom;
              });
            },
            isActive: skill == Skill.lightroom ? true : false,
            skill: Skill.lightroom,
            image: 'assets/images/app_icon_02.png',
            title: 'Lightroom',
            color: Colors.indigoAccent,
          ),
        ],
      ),
    );
  }
}

class SkillBox extends StatelessWidget {
  final String image;
  final String title;
  final Color color;
  final Skill skill;
  final bool isActive;
  final Function() onTap;
  const SkillBox({
    super.key,
    required this.image,
    required this.title,
    required this.color,
    required this.skill,
    required this.isActive,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 110,
        height: 120,
        alignment: Alignment.center,
        decoration: isActive
            ? BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                decoration: isActive
                    ? BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 3,
                          ),
                        ],
                      )
                    : null,
                child: Image.asset(image, width: 50, height: 50)),
            const SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
