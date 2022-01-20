import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/datamodels/comment/comment_model.dart';
import 'package:hulunfechi/datamodels/post/post_model.dart';
import 'package:hulunfechi/datamodels/user/user_model.dart';

Post FAKE_POST = Post(
  id: 1,
  country: Country(name: ''),
  user: User(
    id: 1,
    username: 'Eshetu Lukas',
    firstname: 'Eshetu ',
    lastname: 'Lukas',
    email: 'tekalukas@gmail.com',
    accessToken: '',
    tokenType: '',
    fullname: '',
  ),
  sectors: Sector(id: 1, name: "name"),
  category: Category(id: 1, name: 'ICT'),
  subCategory: SubCategory(id: 1, name: "News"),
  platform: Platform(id: 1, name: "Tilket"),

  // country: 'Ethiopia',
  // platform: 'Tilket',
  // category: 'ICT',
  // subCategory: 'News',
  title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec placerat lacinia finibus. Morbi luctus sed urna nec sagittis. Proin posuere est convallis nisi congue, tincidunt facilisis mauris ultricies. Pellentesque efficitur et turpis a ultrices. Curabitur pellentesque, purus ut ultrices interdum, urna sapien iaculis libero, ut volutpat nisi lacus a justo. Fusce ac nisi dignissim, lacinia turpis quis, dignissim nulla. Vestibulum fringilla dui nisi, sit amet gravida eros molestie in',
  likes: 120,
  comments: 84,
  shares: 5,
);

Post FAKE_POST1 = Post(
  id: 1,
  country: Country(name: ''),
  user: User(
    id: 1,
    username: 'Eshetu Lukas',
    firstname: 'Eshetu ',
    lastname: 'Lukas',
    email: 'tekalukas@gmail.com',
    accessToken: '',
    tokenType: '',
    fullname: '',
  ),
  sectors: Sector(id: 1, name: "name"),
  category: Category(id: 1, name: 'ICT'),
  subCategory: SubCategory(id: 1, name: "News"),
  platform: Platform(id: 1, name: "Tilket"),

  // country: 'Ethiopia',
  // platform: 'Tilket',
  // category: 'ICT',
  // subCategory: 'News',
  title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec placerat lacinia finibus. Morbi luctus sed urna nec sagittis. Proin posuere est convallis nisi congue, tincidunt facilisis mauris ultricies. Pellentesque efficitur et turpis a ultrices. Curabitur pellentesque, purus ut ultrices interdum, urna sapien iaculis libero, ut volutpat nisi lacus a justo. Fusce ac nisi dignissim, lacinia turpis quis, dignissim nulla. Vestibulum fringilla dui nisi, sit amet gravida eros molestie in',
  likes: 120,
  comments: 84,
  shares: 5,
);

PostComment FAKE_COMMENT = PostComment(
  id: 1,
  user: User(
    id: 1,
    username: 'Eshetu Lukas',
    firstname: 'Eshetu ',
    lastname: 'Lukas',
    email: 'tekalukas@gmail.com',
    accessToken: '',
    tokenType: '',
    fullname: '',
  ),
  comment:
      'That is Cool, Thank you for sharing this information i was looking for this',
);

PostComment FAKE_COMMENT1 = PostComment(
  id: 1,
  user: User(
    id: 1,
    username: 'Eshetu Lukas',
    firstname: 'Eshetu ',
    lastname: 'Lukas',
    email: 'tekalukas@gmail.com',
    accessToken: '',
    tokenType: '',
    fullname: '',
  ),
  comment: 'I don\'t agree with that.',
);
