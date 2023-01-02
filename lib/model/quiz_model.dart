class QuizModel {
  final String headingText;
  final List<String> options;
  final String correctAnswer;

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
        headingText: 'Do you  dream about Girlfriend?',
        options: ['All the time', 'No', 'Occasionally'],
        correctAnswer: 'All the time'),
    QuizModel(
        headingText: 'why are you taking this quiz',
        options: [
          'I am obsessed with my girlfriend',
          'I think girlfriend like me',
          'Because I am bored'
        ],
        correctAnswer: 'I think girlfriend like me'),
    QuizModel(
        headingText:
            'On a scale of 1 to 10. How similar do you think you and girlfriend are?',
        options: ['8-10', '6-8', '1-5'],
        correctAnswer: '8-10'),
    QuizModel(
        headingText:
            'Do you honestly think you are falling in love with girlfriend?',
        options: ['Yes', 'Kind of', 'No'],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText: 'What do like most about girlfriend?',
        options: ['Everything', 'Her Personality', 'Her Look'],
        correctAnswer: 'Everything'),
    QuizModel(
        headingText: 'Does girlfriend have your phone number?',
        options: ['Yeah, girlfriend asked me for it', 'Yes, I gave her', 'No'],
        correctAnswer: 'Yeah, girlfriend asked me for it'),
    QuizModel(
        headingText: 'How many interests do you share with girlfriend?',
        options: ['0', '1-5', '100+'],
        correctAnswer: '100+'),
    QuizModel(
        headingText: 'If girlfriend asked you out on a date,would you go?',
        options: ['Yes', 'I\'m not sure', 'No'],
        correctAnswer: 'Yes'),
    QuizModel(
        headingText:
            'Do you get angry when you miss an opportunity to be with girlfriend?',
        options: ['Yes', 'Sometimes', 'No'],
        correctAnswer: 'Yes'),
  ];

  static final List<QuizModel> quiz2 = [
    QuizModel(
        headingText: 'How often do you text each other?',
        options: ['All the time', 'occasionally', 'we don\'t text'],
        correctAnswer: ''),
    QuizModel(
        headingText: 'Do you  dream about Girlfriend?',
        options: ['All the time', 'No', 'Occasionally'],
        correctAnswer: ''),
    QuizModel(
        headingText: 'why are you taking this quiz',
        options: [
          'I am obsessed with my girlfriend',
          'I think girlfriend like me',
          'Because I am bored'
        ],
        correctAnswer: ''),
    QuizModel(
        headingText:
            'On a scale of 1 to 10. How similar do you think you and girlfriend are?',
        options: ['8-10', '6-8', '1-5'],
        correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
  ];
  static final List<QuizModel> quiz3 = [
    QuizModel(
        headingText: 'How often do you text each other?',
        options: ['All the time', 'occasionally', 'we don\'t text'],
        correctAnswer: ''),
    QuizModel(
        headingText: 'Do you  dream about Girlfriend?',
        options: ['All the time', 'No', 'Occasionally'],
        correctAnswer: ''),
    QuizModel(
        headingText: 'why are you taking this quiz',
        options: [
          'I am obsessed with my girlfriend',
          'I think girlfriend like me',
          'Because I am bored'
        ],
        correctAnswer: ''),
    QuizModel(
        headingText:
            'On a scale of 1 to 10. How similar do you think you and girlfriend are?',
        options: ['8-10', '6-8', '1-5'],
        correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
  ];
  static final List<QuizModel> quiz4 = [
    QuizModel(
        headingText: 'How often do you text each other?',
        options: ['All the time', 'occasionally', 'we don\'t text'],
        correctAnswer: ''),
    QuizModel(
        headingText: 'Do you  dream about Girlfriend?',
        options: ['All the time', 'No', 'Occasionally'],
        correctAnswer: ''),
    QuizModel(
        headingText: 'why are you taking this quiz',
        options: [
          'I am obsessed with my girlfriend',
          'I think girlfriend like me',
          'Because I am bored'
        ],
        correctAnswer: ''),
    QuizModel(
        headingText:
            'On a scale of 1 to 10. How similar do you think you and girlfriend are?',
        options: ['8-10', '6-8', '1-5'],
        correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
    QuizModel(headingText: '', options: ['', '', ''], correctAnswer: ''),
  ];
}
