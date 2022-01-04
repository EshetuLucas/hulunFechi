import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const String DATABASE_PATH = 'hulunfechi_database';
const String EVENT_TABLE = 'event_table';
const String USER_TABLE = 'user_table';

List<String> Categories = [
  'All',
  'Belief',
  'Technology',
  'Knowledge',
  'Health',
  'Competition',
  'Law & Regulation',
  'Finance & Business',
];
const List<Map<String, dynamic>> ACCOUNT_OPTIONS = [
  {
    'title': 'Preference',
    'iconData': FontAwesomeIcons.handHoldingHeart,
  },
  {
    'title': 'Language',
    'iconData': FontAwesomeIcons.language,
  },
  {
    'title': 'Setting',
    'iconData': Icons.settings,
  },
  {'title': 'Following', 'iconData': Icons.thumb_up_alt_outlined},
  {
    'title': 'Terms & Conditions',
    'iconData': CupertinoIcons.signature,
  },
  {
    'title': 'Help center',
    'iconData': Icons.help_outline,
  },
  {
    'title': 'About',
    'iconData': Icons.info_outlined,
  },
  {
    'title': 'Log out',
    'iconData': Icons.logout_rounded,
  },
];
List<String> Knowledge = [
  'Agerawi',
  'Merejawo',
  'Timihert',
  'Mebkat',
  'Gubegnt',
  'Meleyet',
  'Lihket',
  'Memesker',
  'Meteyek',
  'Zegawich',
  'Tewedadari',
  'Enibret',
  'Metenbey',
  'Mefeten',
  'Maseracha',
  'Wetatoch',
  'Setoch',
  'Awajoch',
  'Meneged',
  'Fithawi',
  'Mekemer',
  'Mefeleg',
];
List<String> Law = [
  'Megeber',
  'Firdbet',
  'Torhail',
  'Poleticawi',
  'Asatafi',
  'Metekom',
  'Birr fiset',
  'Metenbey',
  'Megebaya',
  'Awajoch',
  'Fithawi',
  'Mefeleg',
  'Yizota',
  'Ketemoch',
  'Marakot',
  'Tetekaminet',
];
List<String> Finance = [
  'Mamrecha',
  'Gibrnawo',
  'Mahlek',
  'Gubgnt',
  'Nibret',
  'Asatafi',
  'Shirkna',
  'Zegawichi',
  'Metenbey',
  'Megebaya',
  'Meneged',
  'Mekemer',
  'Mefeleg',
  'Meshekel',
  'Ketemoch',
  'Marakot',
  'Tetekaminet',
];
List<String> Technology = [
  'Gulbet',
  'Mitket',
  'Technology',
  'Enibret',
  'Metenbey',
  'Mefeleg',
];
List<String> Competition = [
  'Gitmiya',
  'Asatafi',
  'Meshelem',
  'Tewedadari',
  'Mefeten',
  'Mefeleg',
];

List<String> Belief = [
  'Tilket',
  'Mamlek',
  'Asatafi',
  'Metenbey',
  'Mefeleg',
];

List<String> Health = [
  'Tenachen',
  'Asatafi',
  'Metenbey',
  'Mefeleg',
  'Setoch',
  'Wetatoch'
];

List<String> get All => [
      'All Platforms',
      ...Knowledge,
      ...Law,
      ...Finance,
      ...Technology,
      ...Competition,
      ...Belief,
      ...Health
    ];

List<String> AgerawiCategory = [
  'ICT',
  'Manufacturing',
  'Trading',
  'Health',
  'Education',
  'Agriculture',
  'Investment',
  'Finance',
  'Socila & Culture',
  'Politics & Economy',
  'Sport',
  'Youth, Women & Children',
  'Environment && Climate',
  'Justice',
  'Entertainment',
  'Media',
  'Art',
  'Defense',
  'Security',
  'Construction',
  'Transport',
  'Tourism',
  'Science & Technology',
  'Tax & Customs',
  'Power && Energy',
  'Land',
];

List<String> AgerawiSubCategory = [
  'News',
  'Announcement',
  'Products & Service',
  'Exhabitions',
  'Partnership',
  'Calls for paper',
  'Rules & Regulation',
  'Conferences',
  'Grants',
  'Researches',
  'Loans',
  'Jobs',
  'Bids',
  'Inagurations',
  'Scholarship',
  'Events',
  'Projects',
  'Competitions',
  'Seminars',
  'Conferences',
  'Tariffs',
  'Others',
];
