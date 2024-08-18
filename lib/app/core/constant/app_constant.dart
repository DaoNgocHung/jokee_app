import 'package:jokee_app/app/core/data/model/joke.dart';

class AppConstant {
  AppConstant._();

  static const note1 = "A joke a day keeps the doctor away";

  static const note2 = "If you joke wrong way, your teeth have to pay.(Serious)";

  static const footer =
      "This appis created as part of Hlsolutions program. The materials contained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the information contained on this site";

  static const copyright = "Copyright 2021 HLS";

  static const comeBackLater = "That's all the jokes for today! Come back another day!";

  static const joke1 =
      '''A child asked his father, "How were people born?" So his father said, "Adam and Eve made babies, then their babies became adults and made babies, and so on."

The child then went to his mother, asked her the same question and she told him, "We were monkeys then we evolved to become like we are now."

The child ran back to his father and said, "You lied to me!" His father replied, "No, your mom was talking about her side of the family."''';

  static const joke2 =
      'Teacher: "Kids,what does the chicken give you?" Student: "Meat!" Teacher: "Very good! Now what does the pig give you?" Student: "Bacon!" Teacher: "Great! And what does the fat cow give you?" Student: "Homework!"';

  static const joke3 =
      'The teacher asked Jimmy, "Why is your cat at school today Jimmy?" Jimmy replied crying, "Because I heard my daddy tell my mommy, \'I am going to eat that pussy once Jimmy leaves for school today!\'"';

  static const joke4 =
      'A housewife, an accountant and a lawyer were asked "How much is 2+2?" The housewife replies: "Four!". The accountant says: "I think it\'s either 3 or 4. Let me run those figures through my spreadsheet one more time." The lawyer pulls the drapes, dims the lights and asks in a hushed voice, "How much do you want it to be?"';

  static List<Joke> sampleJokes = [
    Joke(id: 1, content: joke1),
    Joke(id: 2, content: joke2),
    Joke(id: 3, content: joke3),
    Joke(id: 4, content: joke4),
  ];
}
