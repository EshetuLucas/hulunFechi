class FakeCategoryDataModel {
  List<Map<String, dynamic>> listOfCategories = [
    {
      "title": "Entertainment",
      "imageURL": "assets/images/category_images/image3.png",
    },
    {
      "title": "Sport",
      "imageURL": "assets/images/category_images/image1.png",
    },
    {
      "title": "Clown",
      "imageURL": "assets/images/category_images/image2.png",
    },
    {"title": "Hosts", "imageURL": "assets/images/category_images/image4.png"},
    {"title": "Poem", "imageURL": "assets/images/category_images/image5.png"},
    {
      "title": "Performer",
      "imageURL": "assets/images/category_images/image6.png"
    },
  ];
}

Map<String, dynamic> listOfCategories = {
  "all": {"title": "All", "imageURL": "assets/icons/category_icons/all.svg"},
  "singer": {
    "title": "Singers",
    "imageURL": "assets/icons/category_icons/singers_icon.svg"
  },
  "musician": {
    "title": "Musicians",
    "imageURL": "assets/icons/category_icons/musicians_icon.svg"
  },
  "clown": {
    "title": "Clowns",
    "imageURL": "assets/icons/category_icons/clowns_icon.svg"
  },
  "magicians": {
    "title": "Magicians",
    "imageURL": "assets/icons/category_icons/magicians_icon.svg"
  },
  "dancer": {
    "title": "Dancers",
    "imageURL": "assets/icons/category_icons/dancers_icon.svg"
  },
  "comedian": {
    "title": "Comedians",
    "imageURL": "assets/icons/category_icons/comedians_icon.svg"
  },
  "Poet": {
    "title": "Poets",
    "imageURL": "assets/icons/category_icons/poets_icon.svg"
  },
};
List<String> listOfWeekDaysName = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fir',
  'Sat',
  'Sun',
];
List<String> listOfScheduleTime = [
  '8:00AM',
  '8:30AM',
  '9:00AM',
  '9:30AM',
  '10:00AM',
  '10:30AM',
  '11:00AM',
  '11:30AM',
  '12:00AM',
  '12:30AM',
  '1:00PM',
  '1:30PM',
  '2:00PM',
  '2:30PM',
  '3:00PM',
  '3:30PM',
  '4:00PM',
  '4:30PM',
  '5:00PM',
  '5:30PM',
  '6:00PM',
  '6:30PM',
  '7:00PM',
  '7:30PM',
  '8:00PM',
  '8:30PM',
  '9:00PM',
  '9:30PM',
  '10:00PM',
  '10:30PM',
  '11:00PM',
  '11:30PM',
];
List<String> listOfWeekDaysFirstLetter = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
];
List<String> get months => [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
List<Map<String, dynamic>> listOfChat = [
  {
    "name": "Amanda Mayhem",
    "imageURL": "https://homepages.cae.wisc.edu/~ece533/images/cat.png",
    "messages_detail": [
      {
        "message":
            "Hey Amanda, just wondering if you’ll be available at March 27, 8PM for a 4hrs gig. Please let me know. thanks!",
        "time": "",
        "number_of_new_messages": 0,
        "is_sender": true,
        "when": "8:09 PM"
      },
      {
        "message":
            "Hi Parker! Yes I’m available at the said date & time. So excited for this! ??",
        "time": "",
        "number_of_new_messages": 2,
        "is_sender": false,
        "when": "8:14 PM"
      },
      {
        "message": "Okay that’s great! See you!",
        "time": "",
        "number_of_new_messages": 2,
        "is_sender": true,
        "when": "8:34 PM"
      }
    ],
    "is_active": true,
  },
  {
    "name": "Jeff Alex",
    "imageURL": "https://homepages.cae.wisc.edu/~ece533/images/watch.png",
    "messages_detail": [
      {
        "message": "Hey Jeff,",
        "time": "",
        "number_of_new_messages": 0,
        "is_sender": true,
        "when": "8:09 PM"
      },
    ],
    "is_active": true,
  },
  {
    "name": "Amanda Mayhem",
    "imageURL": "https://homepages.cae.wisc.edu/~ece533/images/cat.png",
    "messages_detail": [
      {
        "message":
            "Hey Amanda, just wondering if you’ll be available at March 27, 8PM for a 4hrs gig. Please let me know. thanks!",
        "time": "",
        "number_of_new_messages": 0,
        "is_sender": true,
        "when": "8:09 PM"
      },
      {
        "message":
            "Hi Parker! Yes I’m available at the said date & time. So excited for this! ??",
        "time": "",
        "number_of_new_messages": 2,
        "is_sender": false,
        "when": "8:14 PM"
      },
      {
        "message": "Okay that’s great! See you!",
        "time": "",
        "number_of_new_messages": 2,
        "is_sender": true,
        "when": "8:34 PM"
      }
    ],
    "is_active": true,
  },
  {
    "name": "Jeff Alex",
    "imageURL": "https://homepages.cae.wisc.edu/~ece533/images/watch.png",
    "messages_detail": [
      {
        "message": "Hey Jeff,",
        "time": "",
        "number_of_new_messages": 0,
        "is_sender": true,
        "when": "8:09 PM"
      },
    ],
    "is_active": true,
  },
  {
    "name": "Amanda Mayhem",
    "imageURL": "https://homepages.cae.wisc.edu/~ece533/images/cat.png",
    "messages_detail": [
      {
        "message":
            "Hey Amanda, just wondering if you’ll be available at March 27, 8PM for a 4hrs gig. Please let me know. thanks!",
        "time": "",
        "number_of_new_messages": 0,
        "is_sender": true,
        "when": "8:09 PM"
      },
      {
        "message":
            "Hi Parker! Yes I’m available at the said date & time. So excited for this! ??",
        "time": "",
        "number_of_new_messages": 2,
        "is_sender": false,
        "when": "8:14 PM"
      },
      {
        "message": "Okay that’s great! See you!",
        "time": "",
        "number_of_new_messages": 2,
        "is_sender": true,
        "when": "8:34 PM"
      }
    ],
    "is_active": true,
  },
  {
    "name": "Jeff Alex",
    "imageURL": "https://homepages.cae.wisc.edu/~ece533/images/watch.png",
    "messages_detail": [
      {
        "message": "Hey Jeff,",
        "time": "",
        "number_of_new_messages": 0,
        "is_sender": true,
        "when": "8:09 PM"
      },
    ],
    "is_active": true,
  },
  {
    "name": "Amanda Mayhem",
    "imageURL": "https://homepages.cae.wisc.edu/~ece533/images/cat.png",
    "messages_detail": [
      {
        "message":
            "Hey Amanda, just wondering if you’ll be available at March 27, 8PM for a 4hrs gig. Please let me know. thanks!",
        "time": "",
        "number_of_new_messages": 0,
        "is_sender": true,
        "when": "8:09 PM"
      },
      {
        "message":
            "Hi Parker! Yes I’m available at the said date & time. So excited for this! ??",
        "time": "",
        "number_of_new_messages": 2,
        "is_sender": false,
        "when": "8:14 PM"
      },
      {
        "message": "Okay that’s great! See you!",
        "time": "",
        "number_of_new_messages": 2,
        "is_sender": true,
        "when": "8:34 PM"
      }
    ],
    "is_active": true,
  },
  {
    "name": "Jeff Alex",
    "imageURL": "https://homepages.cae.wisc.edu/~ece533/images/watch.png",
    "messages_detail": [
      {
        "message": "Hey Jeff,",
        "time": "",
        "number_of_new_messages": 0,
        "is_sender": true,
        "when": "8:09 PM"
      },
    ],
    "is_active": true,
  },
];
List<int> listOfDuration = [
  15,
  30,
  60,
];

List<Map<String, dynamic>> listOfProfessions = [
  {"title": "Dance", "imageURL": "assets/images/app_icon_images/dancer.png"},
  {
    "title": "Musician",
    "imageURL": "assets/images/app_icon_images/musician.png"
  },
  {
    "title": "Spoken Word",
    "imageURL": "assets/images/app_icon_images/emcee.png"
  },
  {
    "title": "Magician",
    "imageURL": "assets/images/app_icon_images/magician.png"
  },
  {
    "title": "Comedian",
    "imageURL": "assets/images/app_icon_images/comedian.png"
  },
  {
    "title": "Visual Arts",
    "imageURL": "assets/images/app_icon_images/emcee.png"
  },
  {"title": "Circus", "imageURL": "assets/images/app_icon_images/circus.png"},
];
