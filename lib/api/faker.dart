import 'package:hulunfechi/datamodels/app_data_model.dart';
import 'package:hulunfechi/enums/group.dart';

Post FAKE_POST = Post(
  id: 1,
  userId: 'userId',
  userProfilePic: 'userProfilePic',
  userName: 'Mahlet Abebe',
  group: Group.Belief,
  country: 'Ethiopia',
  platform: 'Tilket',
  category: 'ICT',
  subCategory: 'News',
  title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  body:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec placerat lacinia finibus. Morbi luctus sed urna nec sagittis. Proin posuere est convallis nisi congue, tincidunt facilisis mauris ultricies. Pellentesque efficitur et turpis a ultrices. Curabitur pellentesque, purus ut ultrices interdum, urna sapien iaculis libero, ut volutpat nisi lacus a justo. Fusce ac nisi dignissim, lacinia turpis quis, dignissim nulla. Vestibulum fringilla dui nisi, sit amet gravida eros molestie in',
  likes: 120,
  comments: 84,
  share: 5,
);

Post FAKE_POST1 = Post(
  id: 1,
  userId: 'userId',
  userProfilePic: 'userProfilePic',
  userName: 'Eshetu Lukas',
  group: Group.Technology,
  country: 'Ethiopia',
  platform: 'Gulbet',
  category: 'ICT',
  subCategory: 'News',
  title: 'The future is seamless',
  body:
      'Seamless flow is a concept that usually refers to a production process where information flows automatically across the value chain, producing the desired product or service without human intervention. Normally applied to industrial processes, the concept is tried elsewhere too. At Fiumicino Airport in Rome, for example, the Seamless Flow One-ID platform uses facial recognition technology to reduce the amount of time travelers need to move through the airport. The opt-in self-service solution covers every step of the passenger journey, from check-in all the way to boarding. Those who choose to use it must submit to a facial recognition scan, which is compared to the photo on their official travel document. The traveler’s facial biometrics will be linked to their passport and travel information, allowing them to move through security checkpoints and board the plane without needing to show their boarding pass or any additional documents.',
  likes: 120,
  comments: 84,
  share: 5,
);
