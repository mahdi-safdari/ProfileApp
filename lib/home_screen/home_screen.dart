import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/home_screen/widgets/heart_icon.dart';
import 'package:profile/home_screen/widgets/personal_information.dart';
import 'package:profile/home_screen/widgets/skills.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.toggleTheme, required this.iconDataTheme, required this.selectedLanguageChanged});
  final Function() toggleTheme;
  final IconData iconDataTheme;
  final Function(Language language) selectedLanguageChanged;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Language _language = Language.en;
  void _updateSelectedLanguage(Language language) {
    widget.selectedLanguageChanged(language);
    setState(() {
      _language = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    final TextTheme theme = Theme.of(context).textTheme;
    final AppLocalizations locale = AppLocalizations.of(context)!;
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
        title: Text(locale.profileTitle),
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
                        Text(locale.name, style: theme.titleMedium),
                        const SizedBox(height: 5),
                        Text(locale.job),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(CupertinoIcons.location_solid, size: 16, color: theme.bodySmall!.color),
                            const SizedBox(width: 3),
                            Text(locale.location, style: theme.bodySmall),
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
                locale.summary,
                style: theme.bodySmall!.apply(fontSizeFactor: 1.03),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(locale.selectedLanguage),
                  CupertinoSlidingSegmentedControl<Language>(
                      backgroundColor: Theme.of(context).dividerColor,
                      groupValue: _language,
                      thumbColor: Theme.of(context).dividerColor.withOpacity(0.15),
                      children: {
                        Language.en: Text(locale.enLanguage, style: const TextStyle(fontSize: 14)),
                        Language.fa: Text(
                          locale.faLanguage,
                          style: const TextStyle(fontSize: 14),
                        ),
                      },
                      onValueChanged: (value) {
                        if (value != null) _updateSelectedLanguage(value);
                      })
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 16, bottom: 12, right: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    locale.skills,
                    style: theme.titleMedium!.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(width: 2),
                  const Icon(CupertinoIcons.chevron_down, size: 16),
                ],
              ),
            ),
            const Skills(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 16, bottom: 16, right: 24),
              child: Text(
                locale.personalInformation,
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

enum Language {
  en,
  fa,
}
