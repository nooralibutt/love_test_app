class QuizModel {
  final String headingText;
  final List<String> options;
  final String correctAnswer;

  static final List<List<QuizModel>> quizList = [
    QuizModel.quiz1,
    QuizModel.quiz2,
    QuizModel.quiz3,
    QuizModel.quiz4,
    QuizModel.quiz5,
    QuizModel.quiz1,
    QuizModel.quiz2,
    QuizModel.quiz3,
    QuizModel.quiz4,
    QuizModel.quiz5
  ];

  QuizModel(
      {required this.headingText,
      required this.options,
      required this.correctAnswer});

  static final List<QuizModel> quiz1 = [
    QuizModel(
        headingText: 'How often do you text each other?',
        options: ['All the time', 'occasionally', 'we don\'t text'],
        correctAnswer: 'All the time'),
    QuizModel(
        headingText: 'Do you  dream about partner?',
        options: ['All the time', 'No', 'Occasionally'],
        correctAnswer: 'All the time'),
    QuizModel(
        headingText: 'why are you taking this quiz?',
        options: [
          'I am obsessed with my partner',
          'I think my partner likes me',
          'Because I am bored'
        ],
        correctAnswer: 'I think your partner likes  you'),
    QuizModel(
        headingText:
            'On a scale of 1 to 10. How similar do you think you and your partner are?',
        options: ['8-10', '6-8', '1-5'],
        correctAnswer: '8-10'),
    QuizModel(
        headingText:
            'Do you honestly think you are falling in love with your partner?',
        options: ['Yes', 'Kind of', 'No'],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText: 'What do like most about your partner?',
        options: ['Everything', 'His/Her Personality', 'His/Her Look'],
        correctAnswer: 'Everything'),
    QuizModel(
        headingText: 'Does your partner have your phone number?',
        options: ['Yeah, my partner asked me for it', 'Yes, I gave them', 'No'],
        correctAnswer: 'Yeah, my partner asked me for it'),
    QuizModel(
        headingText: 'How many interests do you share with your partner?',
        options: ['0', '1-5', '100+'],
        correctAnswer: '100+'),
    QuizModel(
        headingText: 'If your partner asked you out on a date,would you go?',
        options: ['Yes', 'I\'m not sure', 'No'],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText:
            'Do you get angry when you miss an opportunity to be with your partner?',
        options: ['Yes', 'Sometimes', 'No'],
        correctAnswer: 'Yes'),
  ];

  static final List<QuizModel> quiz2 = [
    QuizModel(
        headingText: 'How often do you talk with your partner?',
        options: [
          'Everyday, even weekends',
          'most but not everyday',
          'Every once in a while '
        ],
        correctAnswer: 'Everyday, even weekends'),
    QuizModel(
        headingText: 'Does your partner ever give  your compliments?',
        options: ['Yes, All of the time! ', 'Occasionally ', 'No'],
        correctAnswer: 'Occasionally'),
    QuizModel(
        headingText: 'Do you get excited or nervous when you see him/her?',
        options: ['Yes', 'Sometimes', 'Never'],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText: 'Other People when you’re around? ',
        options: ['No', 'A little', 'Yes'],
        correctAnswer: 'No'),
    QuizModel(
        headingText:
            'What would you do if you have a date but your partner is one hour late?',
        options: [
          'I’ll wait until they show up',
          'I’ll wait 30 minutes',
          'I’ll leave immediately'
        ],
        correctAnswer: 'I’ll wait until they show up'),
    QuizModel(
        headingText: 'Do you get excited when you see your partner?',
        options: ['Always', 'Sometimes', 'No'],
        correctAnswer: 'Always'),
    QuizModel(
        headingText: 'Do you enjoy each other’s company?',
        options: ['Yes, we’re really Good friends', 'A little', 'Not at all'],
        correctAnswer: 'Yes, we’re really Good friends'),
    QuizModel(
        headingText: 'Bought you something or made something for you?',
        options: [
          'Yes, just because',
          'Yes, for valentine’s day or my birthday',
          'No'
        ],
        correctAnswer: 'Yes, just because'),
    QuizModel(
        headingText: 'Is there anything you want to change about your partner?',
        options: [
          'Nothing, they are perfect',
          'A few things',
          'Quite a lot of things'
        ],
        correctAnswer: 'Nothing, they are perfect'),
    QuizModel(
        headingText: 'How long have you had a crush on your partner?',
        options: ['Over a year', 'A few months', 'A few weeks'],
        correctAnswer: 'A few weeks'),
  ];
  static final List<QuizModel> quiz3 = [
    QuizModel(
        headingText:
            'Do you honestly think you are falling in love with your partner?',
        options: ['Yes', 'Kind of', 'No'],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText: 'Do you smile every time you think about your partner?',
        options: ['Yes', 'A little', 'No'],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText:
            'Would you feel jealous if you saw anyone else interested in your partner?',
        options: ['Definitely', 'I think so', 'Not at all'],
        correctAnswer: 'Definitely'),
    QuizModel(
        headingText: 'Do you feel comfortable in each other’s company?',
        options: [
          'Yes, it feel natural',
          'No, it feels awkward',
          'We don’t hang out'
        ],
        correctAnswer: 'Yes, it feel natural'),
    QuizModel(
        headingText: 'Has your partner told you that they like you?',
        options: ['Yes', 'I dont\'t think so', 'No'],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText: 'If you talk, who initiates conversation first?',
        options: ['They do', 'Always me', '50-50'],
        correctAnswer: '50-50'),
    QuizModel(
        headingText: 'Do you constantly check your partner\’s social media?',
        options: ['Everyday', 'Occasionally', 'No'],
        correctAnswer: 'No'),
    QuizModel(
        headingText: 'Do you flirt with your partner when you are with them?',
        options: ['Yes all the time', 'Sometimes', 'Not at all'],
        correctAnswer: 'Not at all'),
    QuizModel(
        headingText: 'How long does it take your partner to respond to a text?',
        options: [
          'They reply instantly',
          'A few hours',
          'we never text each other'
        ],
        correctAnswer: 'They reply instantly'),
    QuizModel(
        headingText: 'Are you two the some age?',
        options: ['Yes', '2-3 years apart', 'Over 3 years apart'],
        correctAnswer: 'Yes'),
  ];
  static final List<QuizModel> quiz4 = [
    QuizModel(
        headingText: 'Does your partner know you exist?',
        options: ['Yes, We’re friends', 'We’ve spoken a few times ', 'Nope'],
        correctAnswer: 'Yes, We’re friends'),
    QuizModel(
        headingText:
            'Would you rather be with your partner right now instead of doing this test?',
        options: ['Definitely', 'I am not sure', 'No'],
        correctAnswer: 'I am not sure'),
    QuizModel(
        headingText:
            'Has your partner ever gone out of their way to help you with something?',
        options: ['Yes, lots of time', 'Occasionally', 'No'],
        correctAnswer: 'Yes, lots of time'),
    QuizModel(
        headingText:
            'Do you get angry when you miss an opportunity to be with your partner?',
        options: ['Yes', 'Sometimes', 'No'],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText: 'Do you argue with each other?',
        options: ['No', 'Occasionally', 'Yes, we argue quite a lot'],
        correctAnswer: 'Occasionally'),
    QuizModel(
        headingText: 'Do you think you like your partner?',
        options: ['Yes, I’m pretty sure', 'I’m not sure', 'No'],
        correctAnswer: 'Yes, I’m pretty sure'),
    QuizModel(
        headingText: 'Do you know what type of music your partner likes?',
        options: ['Yes', 'I think so', 'No'],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText: 'Have you ever touched your partner?',
        options: ['Yes', 'Kind of', 'No'],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText: 'How often does your partner pop into your head?',
        options: ['All the time?', 'A couple of times a day', 'Hardly ever'],
        correctAnswer: 'A couple of times a day'),
    QuizModel(
        headingText: 'Has your partner told you that they like you?',
        options: ['Yes', 'No', 'I don\'t think so'],
        correctAnswer: 'Yes'),
  ];
  static final List<QuizModel> quiz5 = [
    QuizModel(
        headingText: 'Does your partner make an effort to hang out with you?',
        options: ['Yes, All the time', 'Yes, but like a friend', 'No'],
        correctAnswer: 'Yes, All the time'),
    QuizModel(
        headingText: 'Have you ever caught your partner staring at you?',
        options: [
          'Yes',
          'I don\'t think so',
          'No, I’m usually the one staring'
        ],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText: ' Do you talk to your partner about personal things?',
        options: ['Yes', 'Not Really', 'No'],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText: 'Have you ever held your partner\’s hand?',
        options: [
          'Yes, It was very romantic',
          'yes, we’ve held hands as  part of a game',
          'No'
        ],
        correctAnswer: 'Yes, It was very romantic'),
    QuizModel(
        headingText: 'Does your partner lean in when you speak?',
        options: ['Yes', 'I am not sure', 'No'],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText: 'Do you try to dress up to impress your partner?',
        options: ['Yes, all the time', 'Occasionally ', 'No'],
        correctAnswer: 'Yes, all the time'),
    QuizModel(
        headingText:
            'On a scale of 1 to 5 (5 being totally in love). How much do you like your partner?',
        options: ['5', '3.4', '1.2'],
        correctAnswer: '5'),
    QuizModel(
        headingText: 'Have you ever touched your partner?',
        options: ['Yes', 'Occasionally', 'No'],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText: 'Is there anything you would change about your partner?',
        options: [
          'Yes, lots og things!',
          'A few things',
          'No, I think they are perfect!'
        ],
        correctAnswer: 'No, I think they are perfect!'),
    QuizModel(
        headingText:
            'If you asked your partner to do something for you, do you think they would do it?',
        options: ['Yes', 'It depends', 'No'],
        correctAnswer: 'Yes'),
  ];
}
