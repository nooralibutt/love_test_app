import 'package:collection/collection.dart';

class ChatLevel {
  static const BOT_KEY = 'bot';
  static const USER_KEY = 'user';

  final String levelName;
  final String botName;
  final String botImg;
  final String userImg;
  final Map<String, List<String>> chatList;
  final List<String> successMessages;
  final List<String> failureMessages;

  ChatLevel({
    required this.levelName,
    required this.botName,
    required this.botImg,
    required this.userImg,
    required this.chatList,
    required this.successMessages,
    required this.failureMessages,
  });

  bool isSuccessMessage(String message) =>
      this.successMessages.contains(message);

  bool isErrorMessage(String message) => this.failureMessages.contains(message);

  bool get willSenderInitiateChat => chatList.keys.first == BOT_KEY;

  String? get getSenderMessage => chatList[BOT_KEY]?.firstOrNull;

  String? get getReceiverMessage => chatList[USER_KEY]?.firstOrNull;

  static bool isLie(String message) => message.contains('(Lie)');

  static bool isTruth(String message) => message.contains('(Truth)');

  static String truncateLie(String message) =>
      message.replaceAll('(Lie)', '').trim();

  static String truncateTruth(String message) =>
      message.replaceAll('(Truth)', '').trim();

  static ChatLevel firstLevel() {
    Map<String, List<String>> chatList = Map();

    chatList[BOT_KEY] = ['Hi! Do you have shoes in your shop?'];
    chatList['Hi! Do you have shoes in your shop?'] = ['No sorry', 'Yes'];
    chatList['No sorry'] = ['I really need them 😞'];
    chatList['I really need them 😞'] = [
      'No sorry 😏',
      'ok we\'ll figure it out!'
    ];
    chatList['No sorry 😏'] = ['Bruhhhhhh 🤯'];
    chatList['Yes'] = ['Great I want a new sneakers!'];
    chatList['ok we\'ll figure it out!'] = ['Great I want a new sneakers!'];
    chatList['Great I want a new sneakers!'] = [
      'we don\'t have teacher\'s sneakers',
      'what\'s your size?'
    ];
    chatList['we don\'t have teacher\'s sneakers'] = ['Bruhhhhhh 🤯'];
    chatList['what\'s your size?'] = ['One inverted foot'];
    chatList['One inverted foot'] = ['That\'s too scary', 'What color?'];
    chatList['That\'s too scary'] = ['Bruhhhhhh 🤯'];
    chatList['What color?'] = ['Red with white stripes'];
    chatList['Red with white stripes'] = ['Good choice!', '2 or 4 sneakers?'];
    chatList['Good choice!'] = ['I want 4. One for each leg!'];
    chatList['2 or 4 sneakers?'] = ['I want 4. One for each leg!'];
    chatList['I want 4. One for each leg!'] = ['It\'ll be 49\$'];
    chatList['It\'ll be 49\$'] = ['Can I pay in diamonds?'];
    chatList['Can I pay in diamonds?'] = ['NO!', 'Uhh ok..'];
    chatList['NO!'] = ['Bruhhhhhh 🤯'];
    chatList['Uhh ok..'] = ['Great! Thank you 😍'];

    return ChatLevel(
      levelName: 'Sell teacher shoes',
      botName: 'Scary Teacher',
      botImg: 'assets/images/bg_image.png',
      userImg: 'assets/images/bg_image.png',
      chatList: chatList,
      successMessages: ['Great! Thank you 😍'],
      failureMessages: ['Bruhhhhhh 🤯'],
    );
  }

  static List<ChatLevel> allLevels() {
    return [
      level1(),
      level2(),
      level3(),
      level4(),
      level5(),
      level6(),
      level7(),
      level8(),
      level9(),
      level10(),
      level1(),
      level2(),
      level3(),
      level4(),
      level5(),
      level6(),
      level7(),
      level8(),
      level9(),
      level10(),
      level11(),
      level12(),
      level13(),
      level14(),
      level15(),
    ];
  }

  static ChatLevel anotherLevel() {
    Map<String, List<String>> chatList = Map();

    chatList[USER_KEY] = ['No sorry', 'Yes'];
    chatList['No sorry'] = ['I really need them 😞'];
    chatList['I really need them 😞'] = [
      'No sorry 😏',
      'ok we\'ll figure it out!'
    ];
    chatList['No sorry 😏'] = ['Bruhhhhhh 🤯'];
    chatList['Yes'] = ['Great I want a new sneakers!'];
    chatList['ok we\'ll figure it out!'] = ['Great I want a new sneakers!'];
    chatList['Great I want a new sneakers!'] = [
      'we don\'t have teacher\'s sneakers',
      'what\'s your size?'
    ];
    chatList['we don\'t have teacher\'s sneakers'] = ['Bruhhhhhh 🤯'];
    chatList['what\'s your size?'] = ['One inverted foot'];
    chatList['One inverted foot'] = ['That\'s too scary', 'What color?'];
    chatList['That\'s too scary'] = ['Bruhhhhhh 🤯'];
    chatList['What color?'] = ['Red with white stripes'];
    chatList['Red with white stripes'] = ['Good choice!', '2 or 4 sneakers?'];
    chatList['Good choice!'] = ['I want 4. One for each leg!'];
    chatList['2 or 4 sneakers?'] = ['I want 4. One for each leg!'];
    chatList['I want 4. One for each leg!'] = ['It\'ll be 49\$'];
    chatList['It\'ll be 49\$'] = ['Can I pay in diamonds?'];
    chatList['Can I pay in diamonds?'] = ['NO!', 'Uhh ok..'];
    chatList['NO!'] = ['Bruhhhhhh 🤯'];
    chatList['Uhh ok..'] = ['Great! Thank you 😍'];

    return ChatLevel(
      levelName: 'Borrow his car',
      botName: 'Felix',
      botImg: 'assets/splash.jpg',
      userImg: 'assets/default.jpg',
      chatList: chatList,
      successMessages: ['Great! Thank you 😍'],
      failureMessages: ['Bruhhhhhh 🤯'],
    );
  }

  static ChatLevel level1() {
    Map<String, List<String>> chatList = Map();

    chatList[BOT_KEY] = ['where were you yesterday?'];
    chatList['where were you yesterday?'] = [
      'My dog was sick?(Lie)',
      'Pirates kidnap me(Lie)'
    ];
    chatList['My dog was sick?(Lie)'] = ['You have a dog?'];
    chatList['Pirates kidnap me(Lie)'] = ['Pirates?! In Ohio?'];
    chatList['You have a dog?'] = [
      'No i just overslept(Truth)',
      'Her name is Cindy(Lie)'
    ];
    chatList['No i just overslept(Truth)'] = ['Okay enough you are expelled'];
    chatList['Her name is Cindy(Lie)'] = ['I love dogs but call me next time'];
    chatList['Pirates?! In Ohio?'] = [
      'Yes they are very dangerous',
      'Sounds weird.But it\'s true'
    ];
    chatList['Yes they are very dangerous'] = ['But you are free now. Right?'];
    chatList['Sounds weird.But it\'s true'] = ['But you are free now. Right?'];
    chatList['But you are free now. Right?'] = [
      'I escaped them',
      'they let me go'
    ];
    chatList['I escaped them'] = [
      'i don\'t really believe you! Meet me in my office'
    ];
    chatList['they let me go'] = ['Why?'];
    chatList['Why?'] = ['They were Scared of me', 'I made them my friends'];
    chatList['They were Scared of me'] = [
      'i don\'t really believe you! Meet me in my office'
    ];
    chatList['I made them my friends'] = ['uh, Okay'];
    return ChatLevel(
      levelName: 'Find excuse',
      botName: 'Scary Teacher',
      botImg: 'assets/splash.jpg',
      userImg: 'assets/kids/kid1.png',
      chatList: chatList,
      successMessages: [
        'I love dogs but call me next time',
        'Oh it\'s okay. Sorry for bothering you',
        'uh, Okay'
      ],
      failureMessages: [
        'Okay enough you are expelled',
        'i don\'t really believe you! Meet me in my office'
      ],
    );
  }

  static ChatLevel level2() {
    Map<String, List<String>> chatList = Map();

    chatList[USER_KEY] = ['OMG!', 'Hey Teacher'];
    chatList['OMG!'] = ['What?'];
    chatList['Hey Teacher'] = ['What?'];
    chatList['What?'] = ['i had an accident', 'i got expelled from school'];
    chatList['i had an accident'] = ['What happened?'];
    chatList['What happened?'] = ['i burned my eyebrows', 'i crashed your car'];
    chatList['i burned my eyebrows'] = ['How? 😟'];

    chatList['How? 😟'] = ['During my fireshow', 'with flamethrower'];

    chatList['During my fireshow'] = ['You are Kidding me!!'];
    chatList['You are Kidding me!!'] = ['HAHA I pranked you'];
    chatList['with flamethrower'] = ['OMG! WHAT Now!?'];
    chatList['OMG! WHAT Now!?'] = ['Pranked'];
    chatList['i crashed your car'] = ['No you did not'];
    chatList['No you did not'] = ['How do you know', 'yes i did'];
    chatList['How do you know'] = ['Because i am sitting in it now'];
    chatList['yes i did'] = ['Because i am sitting in it now'];
    chatList['i got expelled from school'] = ['How?'];
    chatList['How?'] = ['I escaped from there', 'i beat up another teacher'];
    chatList['I escaped from there'] = ['Why?'];
    chatList['i beat up another teacher'] = ['Why? 😡'];
    chatList['Why?'] = ['He was rude', 'He gave me F'];
    chatList['Why? 😡'] = ['I hate it there', 'I was so bored'];
    chatList['He was rude'] = ['come to my office Now! I am so angry at you!!'];
    chatList['He gave me F'] = [
      'come to my office Now! I am so angry at you!!'
    ];
    chatList['I hate it there'] = [
      'come to my office Now! I am so angry at you!!'
    ];
    chatList['I was so bored'] = [
      'come to my office Now! I am so angry at you!!'
    ];
    chatList['come to my office Now! I am so angry at you!!'] = [
      'hehehe PRANKED😂'
    ];
    chatList['hehehe PRANKED😂'] = ['Thank GOD'];
    return ChatLevel(
      levelName: 'Prank Teacher!',
      botName: 'Teacher',
      botImg: 'assets/splash.jpg',
      userImg: 'assets/kids/kid7.png',
      chatList: chatList,
      successMessages: ['HAHA I pranked you', 'Pranked', 'Thank GOD'],
      failureMessages: [
        'Because i am sitting in it now',
      ],
    );
  }

  static ChatLevel level3() {
    Map<String, List<String>> chatList = Map();

    chatList[USER_KEY] = ['Hello Teacher!'];
    chatList['Hello Teacher!'] = ['What do you want?'];
    chatList['What do you want?'] = ['Nothing', 'Go out with you 😊😘'];
    chatList['Nothing'] = ['Leave me alone'];
    chatList['Go out with you 😊😘'] = ['really'];
    chatList['really'] = ['Yes, you seem really cool', 'no lol 😂'];
    chatList['no lol 😂'] = ['son of a biscuit!..'];
    chatList['Yes, you seem really cool'] = ['you are also kinda cute'];
    chatList['you are also kinda cute'] = [
      'Will you marry me? 😍',
      'Wanna hang out?'
    ];
    chatList['Will you marry me? 😍'] = [
      'No, You are my student. Are you crazy?'
    ];
    chatList['Wanna hang out?'] = ['yes!'];
    return ChatLevel(
      levelName: 'Ask her out',
      botName: 'Pretty Teacher',
      botImg: 'assets/kids/kid6.png',
      userImg: 'assets/kids/kid4.png',
      chatList: chatList,
      successMessages: ['yes!'],
      failureMessages: [
        'Leave me alone',
        'No, You are my student. Are you crazy?',
        'son of a biscuit!..'
      ],
    );
  }

  // elephants => kids
  // lions => grads
  static ChatLevel level4() {
    Map<String, List<String>> chatList = Map();

    chatList[USER_KEY] = ['are you hiring?'];
    chatList['are you hiring?'] = ['What do you want to do?'];
    chatList['What do you want to do?'] = ['teaching kids', 'teaching grads'];
    chatList['teaching grads'] = ['it is a bit risky know'];
    chatList['teaching kids'] = ['that\'s a really dangerous job!'];
    chatList['that\'s a really dangerous job!'] = [
      'why?',
      'is teaching grads is safer?'
    ];
    chatList['why?'] = ['the last teacher was beaten'];
    chatList['the last teacher was beaten'] = [
      'Uff.I\'ll do something else',
      'I\'m not scared 😎'
    ];
    chatList['Uff.I\'ll do something else'] = ['You can teach the kids'];
    chatList['You can teach the kids'] = ['That\'s great!'];
    chatList['That\'s great!'] = ['it is a bit risky you know'];
    chatList['it is a bit risky you know'] = ['Why?'];
    chatList['Why?'] = ['Grads burnt car of the last guy.'];
    chatList['Grads burnt car of the last guy.'] = [
      'I changed my mind...',
      'Do I get good salary'
    ];
    chatList['I changed my mind...'] = ['okay...'];
    chatList['Do I get good salary'] = ['500\$ month. No health insurance'];
    chatList['I\'m not scared 😎'] = ['700\$ month.No health insurance'];
    chatList['700\$ month.No health insurance'] = [
      'I take it',
      'I need better offer'
    ];
    chatList['I take it'] = ['Good! see you monday'];
    chatList['I need a better offer'] = ['Why? 🙄'];
    chatList['Why? 🙄'] = ['It is dangerous 😵', 'I\'m really good with grads'];
    chatList['It is dangerous 😵'] = ['So what?'];
    chatList['So what?'] = ['I\'m not doing it! 😠', 'Ok I take the deal'];
    chatList['I\'m not doing it! 😠'] = ['okay...'];
    chatList['Ok I take the deal'] = ['Good! see you monday'];
    chatList['I\'m really good with grads'] = ['How good?'];
    chatList['How good?'] = [
      'I have two grads in my house',
      'I have seen grads documentary'
    ];
    chatList['I have two grads in my house'] = ['1000\$+health insurance'];
    chatList['I have seen grads documentary'] = ['1000\$+health insurance'];

    chatList['is teaching grads is safer?'] = [
      'Grads burnt car of the last guy.'
    ];
    chatList['Grads burnt car of the last guy.'] = [
      'I changed my mind...',
      'do i get a good salary?'
    ];

    chatList['it is a bit risky know'] = ['Why? 😒'];
    chatList['Why? 😒'] = ['Grads burnt car of the last guy.'];
    chatList['do i get a good salary?'] = ['500\$ month. No health insurance'];
    chatList['500\$ month. No health insurance'] = [
      'I need better offer',
      'Great! 😊'
    ];
    chatList['I need better offer'] = ['why? 🤔'];
    chatList['why? 🤔'] = [
      'I\'m best kids teacher in town 😎',
      'It is dangerous'
    ];
    chatList['It is dangerous'] = ['So What?'];
    chatList['So What?'] = ['I\'m not doing it! 😠', 'Ok i take the deal'];
    chatList['Ok i take the deal'] = ['see you monday'];
    chatList['I\'m best kids teacher in town 😎'] = [
      'How many kids you taught?'
    ];
    chatList['How many kids you taught?'] = ['1000', '100'];
    chatList['100'] = ['1000\$+health insurance'];
    chatList['1000'] = ['1000\$+health insurance'];
    chatList['1000\$+health insurance'] = ['Still not good'];
    chatList['Still not good'] = ['I can\'t give you a better offer'];
    chatList['I can\'t give you a better offer'] = [
      'Bye!',
      'Ok 1000\$ is good enough'
    ];
    chatList['Bye!'] = ['OK wait.1500\$'];
    chatList['OK wait.1500\$'] = ['Great😎'];
    chatList['Ok 1000\$ is good enough'] = ['Great😎'];
    chatList['Great😎'] = ['see you monday'];
    chatList['Great! 😊'] = ['see you monday'];

    return ChatLevel(
      levelName: 'Get Teachers Job',
      botName: 'School HR',
      botImg: 'assets/kids/kid5.png',
      userImg: 'assets/splash.jpg',
      chatList: chatList,
      successMessages: ['see you monday', 'Good! see you monday'],
      failureMessages: ['okay...', 'Okay...'],
    );
  }

  static ChatLevel level5() {
    Map<String, List<String>> chatList = Map();

    chatList[BOT_KEY] = ['Where are you?'];
    chatList['Where are you?'] = ['In school(Lie)', 'Party(Truth)'];
    chatList['In school(Lie)'] = ['No you are not it\'s 8 p.m'];
    chatList['No you are not it\'s 8 p.m'] = [
      'Ok. I\'m at the party(Truth)',
      'I\'m working on a project(Lie)'
    ];
    chatList['I\'m working on a project(Lie)'] = [
      'i don\'t believe you. I\'m driving there right now'
    ];
    chatList['Party(Truth)'] = ['Who is there with you?'];
    chatList['Randy(BAD KID 😈)'] = ['OMG! Coming there rn!'];
    chatList['Ok. I\'m at the party(Truth)'] = ['Who is there with you?'];
    chatList['Who is there with you?'] = ['Randy(BAD KID 😈)', 'Oliver(NERD)'];
    chatList['Oliver(NERD)'] = ['When are you coming home?'];
    chatList['When are you coming home?'] = [
      'I\'m on my way!(Lie)',
      'Morning, probably(Truth)'
    ];
    chatList['I\'m on my way!(Lie)'] = ['Okay honey i\'ll waiting for you'];
    chatList['Morning, probably(Truth)'] = ['Okay honey i\'ll waiting for you'];

    return ChatLevel(
      levelName: 'Calm down mom',
      botName: 'MOM',
      botImg: 'assets/kids/kid8.png',
      userImg: 'assets/kids/kid7.png',
      chatList: chatList,
      successMessages: ['Okay honey i\'ll waiting for you'],
      failureMessages: [
        'i don\'t believe you. I\'m driving there right now',
        'OMG! Coming there rn!'
      ],
    );
  }

  static ChatLevel level6() {
    Map<String, List<String>> chatList = Map();

    chatList[BOT_KEY] = ['let\'s do something crazy! 😛'];
    chatList['let\'s do something crazy! 😛'] = [
      'Like What? 😂',
      'What do you mean?'
    ];
    chatList['Like What? 😂'] = ['Adventure or something..'];
    chatList['What do you mean?'] = ['Adventure or something..'];
    chatList['Adventure or something..'] = ['Good idea', 'Great idea 😎'];
    chatList['Good idea'] = ['Do you have some ideas?'];
    chatList['Great idea 😎'] = ['Do you have some ideas?'];
    chatList['Do you have some ideas?'] = ['Let\'s go on a road trip'];
    chatList['Let\'s go on a road trip'] = ['Where? 😃'];
    chatList['Where? 😃'] = ['Canada', 'Slovakia'];
    chatList['Canada'] = ['Good but i Don\'t have a car...'];
    chatList['Slovakia'] = ['Where is Slovakia'];
    chatList['Good but i Don\'t have a car...'] = [
      'i\'ll take my dad\'s',
      'We can hitchhike'
    ];
    chatList['Where is Slovakia'] = ['In South East Asia', 'In middle Europe'];
    chatList['In middle Europe'] = ['So we need plane tickets right?'];
    chatList['So we need plane tickets right?'] = [
      'We\'ll go by a boat',
      'Yes sir!'
    ];
    chatList['In South East Asia'] = ['So we need plane tickets right?'];
    chatList['We\'ll go by a boat'] = ['Now this is an adventure! 😂'];
    chatList['Yes sir!'] = ['But i have no money 😢'];
    chatList['But i have no money 😢'] = [
      'we\'ll steal a plane',
      'we will find a job'
    ];
    chatList['we\'ll steal a plane'] = ['Now this is an adventure! 😂'];
    chatList['we will find a job'] = ['What job?'];
    chatList['What job?'] = [
      'We can be park rangers',
      'We can invest in stocks'
    ];
    chatList['We can be park rangers'] = ['sounds like a plan. I\'m in 🥳'];
    chatList['We can invest in stocks'] = ['No i don\'t have enough money😩'];

    chatList['i\'ll take my dad\'s'] = ['sounds like a plan. I\'m in 🥳'];
    chatList['We can hitchhike'] = ['Now this is an adventure! 😂'];

    return ChatLevel(
      levelName: 'Go on an adventure with teacher',
      botName: 'Teacher',
      botImg: 'assets/splash.jpg',
      userImg: 'assets/kids/kid7.png',
      chatList: chatList,
      successMessages: [
        'Now this is an adventure! 😂',
        'sounds like a plan. I\'m in 🥳'
      ],
      failureMessages: ['No i don\'t have enough money😩'],
    );
  }

  static ChatLevel level7() {
    Map<String, List<String>> chatList = Map();

    chatList[USER_KEY] = ['Hi Al! 😎', 'Hello there'];
    chatList['Hi Al! 😎'] = ['Do we know each other?'];
    chatList['Hello there'] = ['Do we know each other?'];
    chatList['Do we know each other?'] = ['I want to play in your movie 😎'];
    chatList['I want to play in your movie 😎'] = ['What role can you play?'];
    chatList['What role can you play?'] = ['Sheriff', 'Bandit'];
    chatList['Sheriff'] = ['Okay. But you need to bring your own horse'];
    chatList['Bandit'] = ['Can you look scary?'];
    chatList['Okay. But you need to bring your own horse'] = [
      'What?!',
      'I don\'t have a horse'
    ];
    chatList['Can you look scary?'] = [
      'Strangers run away from me',
      'more ugly than scary'
    ];
    chatList['What?!'] = ['We don\'t have budget for a horse'];
    chatList['We don\'t have budget for a horse'] = ['I don\'t have a horse'];
    chatList['I don\'t have a horse'] = ['Then you can\'t play sheriff!'];
    chatList['Then you can\'t play sheriff!'] = [
      'Can i be a bandit?',
      'What else can i play?'
    ];
    chatList['Can i be a bandit?'] = ['Can you look scary?'];
    chatList['What else can i play?'] = ['you can be drunk jimmy'];

    chatList['Strangers run away from me'] = ['Very good see you on set! 😎'];
    chatList['more ugly than scary'] = ['That is not really good'];
    chatList['That is not really good'] = [
      'Sorry for bothering mister 😟',
      'Can i get another role?'
    ];
    chatList['Sorry for bothering mister 😟'] = ['Bye!'];
    chatList['Can i get another role?'] = ['you can be drunk jimmy'];
    chatList['you can be drunk jimmy'] = [
      'Sounds great maestro! 😃',
      'I don\'t want to be drunk jimmy'
    ];
    chatList['I don\'t want to be drunk jimmy'] = ['Stop bothering me 😠'];
    chatList['Sounds great maestro! 😃'] = ['Very good see you on set! 😎'];

    return ChatLevel(
      levelName: 'Get the Acting role',
      botName: 'Al',
      botImg: 'assets/kids/kid3.png',
      userImg: 'assets/splash.jpg',
      chatList: chatList,
      successMessages: ['Very good see you on set! 😎'],
      failureMessages: ['Stop bothering me 😠', 'Bye!'],
    );
  }

  static ChatLevel level8() {
    Map<String, List<String>> chatList = Map();

    chatList[BOT_KEY] = ['Hello student!'];
    chatList['Hello student!'] = ['Hi Teacher!', 'Hello 😃'];
    chatList['Hi Teacher!'] = ['I am looking for an investor'];
    chatList['Hello 😃'] = ['I am looking for an investor'];
    chatList['I am looking for an investor'] = [
      'What for?',
      'Well, look elsewhere'
    ];
    chatList['What for?'] = ['I got a million dollar idea!'];
    chatList['Well, look elsewhere'] = ['You\'ve got to hear me out!'];
    chatList['You\'ve got to hear me out!'] = [
      'No Sorry',
      'Okay what\'s the idea'
    ];
    chatList['No Sorry'] = [
      'You just missed once in a lifetime opportunity 🤯'
    ];
    chatList['Okay what\'s the idea'] = [
      'I\'m going to make pen that writes under water'
    ];
    chatList['I got a million dollar idea!'] = [
      'Not Interested',
      'What\'s the idea'
    ];
    chatList['Not Interested'] = [
      'You just missed once in a lifetime opportunity 🤯'
    ];
    chatList['What\'s the idea'] = [
      'I\'m going to make pen that writes under water'
    ];
    chatList['I\'m going to make pen that writes under water'] = [
      'that\'s pretty useless',
      'Great idea!'
    ];
    chatList['that\'s pretty useless'] = [
      'You just missed once in a lifetime opportunity 🤯'
    ];
    chatList['Great idea!'] = ['Yeah I know! 😎'];
    chatList['Yeah I know! 😎'] = ['How much do you need?', 'I am kidding 😂'];
    chatList['How much do you need?'] = ['100000\$'];
    chatList['100000\$'] = ['I can take a loan!', 'i don\'t have that much'];
    chatList['i don\'t have that much'] = ['How much do you have?'];
    chatList['How much do you have?'] = ['1000\$', '100\$'];
    chatList['100\$'] = ['that\'s too little 😒'];
    chatList['I am kidding 😂'] = [
      'You just missed once in a lifetime opportunity 🤯'
    ];
    chatList['I can take a loan!'] = [
      'That\'s great. We will be rich in no time. 😍'
    ];
    chatList['1000\$'] = ['That\'s great. We will be rich in no time. 😍'];

    return ChatLevel(
      levelName: 'Hear him out',
      botName: 'Scary Teacher',
      botImg: 'assets/splash.jpg',
      userImg: 'assets/kids/kid1.png',
      chatList: chatList,
      successMessages: ['That\'s great. We will be rich in no time. 😍'],
      failureMessages: [
        'that\'s too little 😒',
        'You just missed once in a lifetime opportunity 🤯'
      ],
    );
  }

  static ChatLevel level9() {
    Map<String, List<String>> chatList = Map();

    chatList[BOT_KEY] = ['Name\'s Mr. Rhyme and now It\'s my time to shine'];
    chatList['Name\'s Mr. Rhyme and now It\'s my time to shine'] = [
      'Mr. Ryme smells all the time',
      'Don\'t play with me I\'ve a rhyme degree'
    ];
    chatList['Mr. Ryme smells all the time'] = [
      'That was kinda good but I\'ll ruin your childhood'
    ];
    chatList['Don\'t play with me I\'ve a rhyme degree'] = [
      'That was kinda good but I\'ll ruin your childhood'
    ];
    chatList['That was kinda good but I\'ll ruin your childhood'] = [
      'Mr. Rhyme is stupid your brain must be polluted',
      'Give up or I\'ll erupt'
    ];
    chatList['Mr. Rhyme is stupid your brain must be polluted'] = [
      'I don\'t like your face we can close this case'
    ];
    chatList['Give up or I\'ll erupt'] = [
      'I don\'t like your face we can close this case'
    ];
    chatList['I don\'t like your face we can close this case'] = [
      'I\'m so pretty your mom calls me kitty',
      'You got me...'
    ];
    chatList['I\'m so pretty your mom calls me kitty'] = ['uhh you won'];
    chatList['You got me...'] = ['HAHAHA Take it!'];

    return ChatLevel(
      levelName: 'Challenge him',
      botName: 'Scary Teacher',
      botImg: 'assets/splash.jpg',
      userImg: 'assets/kids/kid3.png',
      chatList: chatList,
      successMessages: ['uhh you won'],
      failureMessages: ['HAHAHA Take it!'],
    );
  }

  static ChatLevel level10() {
    Map<String, List<String>> chatList = Map();

    chatList[BOT_KEY] = ['Wanna hear a good joke?'];
    chatList['Wanna hear a good joke?'] = ['No', 'Yes'];
    chatList['No'] = ['I\'ll tell you anyway 😃'];
    chatList['Yes'] = ['What do you call someone with no body and no nose?'];
    chatList['I\'ll tell you anyway 😃'] = ['Uhh', 'Ok'];
    chatList['Uhh'] = ['What do you call someone with no body and no nose?'];
    chatList['Ok'] = ['What do you call someone with no body and no nose?'];
    chatList['What do you call someone with no body and no nose?'] = [
      '?',
      'How you call them?'
    ];
    chatList['?'] = ['Nobody knows 😂😂'];
    chatList['How you call them?'] = ['Nobody knows 😂😂'];
    chatList['Nobody knows 😂😂'] = [
      'I don\'t get it...',
      'Good joke teacher..'
    ];
    chatList['I don\'t get it...'] = ['Wanna hear another?'];
    chatList['Good joke teacher..'] = ['Wanna hear another?'];
    chatList['Wanna hear another?'] = ['Please NO!!', 'Alright'];
    chatList['Please NO!!'] = ['Bruhh .... 😡'];
    chatList['Please NO!!'] = ['Bruhh .... 😡'];
    chatList['Alright'] = ['What\'s brown and sticky?'];
    chatList['What\'s brown and sticky?'] = ['What is', 'A stick'];
    chatList['What is'] = ['A stick 😂😂'];
    chatList['A stick'] = ['How do you know?'];
    chatList['A stick 😂😂'] = ['😂', 'Teacher stop!'];
    chatList['How do you know?'] = [
      'I heard it like 100X',
      'I\'m really smart'
    ];
    chatList['I\'m really smart'] = ['Last one'];
    chatList['I heard it like 100X'] = ['Last one'];
    chatList['😂'] = ['Last one'];
    chatList['Teacher stop!'] = ['Bruhh .... 😡'];
    chatList['Last one'] = ['Teacher please...', 'ok'];
    chatList['ok'] = ['Don\'t trust atoms.'];
    chatList['Teacher please...'] = ['Don\'t trust atoms.'];
    chatList['Don\'t trust atoms.'] = ['why?'];
    chatList['why?'] = ['They make up everything.'];

    return ChatLevel(
      levelName: 'Hear the jokes',
      botName: 'Scary Teacher',
      botImg: 'assets/splash.jpg',
      userImg: 'assets/kids/kid7.png',
      chatList: chatList,
      successMessages: ['They make up everything.'],
      failureMessages: ['Bruhh .... 😡'],
    );
  }

  static ChatLevel level11() {
    Map<String, List<String>> chatList = Map();

    chatList[ChatLevel.BOT_KEY] = ['Greetings friend'];
    chatList['Greetings friend'] = ['Who you?', 'Do we Know eachother?'];
    chatList['Who you?'] = ['I\'m greatest hacker of all time'];
    chatList['I\'m greatest hacker of all time'] = [
      'So what',
      'What do u want?'
    ];
    chatList['So what'] = ['Send me 100\$ or you\'ll get hacked'];
    chatList['Send me 100\$ or you\'ll get hacked'] = ['oK', 'lol 😂'];
    chatList['oK'] = ['I changed my mind. Send me 200\$'];
    chatList['I changed my mind. Send me 200\$'] = ['No', 'OK'];
    chatList['No'] = ['Ok 100\$'];

    chatList['Ok 100\$'] = ['No', 'OK'];
    chatList['OK'] = ['I am Glad we made the deal'];
    chatList['lol 😂'] = ['I will hack you..'];
    chatList['I will hack you..'] = ['Why?', 'Hack somebody else'];
    chatList['Why?'] = ['Because that\'s what hackers do'];
    chatList['Hack somebody else'] = ['No I Choosed you'];
    chatList['No I Choosed you'] = ['Why?', 'Leave me alone'];
    chatList['Leave me alone'] = ['Why Shouldn\'t I hack you'];
    chatList['Because that\'s what hackers do'] = [
      'Get Lost!',
      'You are not Hacking me'
    ];
    chatList['Get Lost!'] = ['Why Shouldn\'t I hack you'];
    chatList['You are not Hacking me'] = ['Why Shouldn\'t I hack you'];
    chatList['Why Shouldn\'t I hack you'] = [
      'I\'m great Hacker myself(Lie)',
      'I\'ll know who you are (Lie)'
    ];
    chatList['I\'m great Hacker myself(Lie)'] = ['That cannot be.'];
    chatList['That cannot be.'] = ['Test me!', 'It\'s true'];
    chatList['Test me!'] = ['What does VPN stands for?'];
    chatList['What does VPN stands for?'] = ['Virtual Private network'];
    chatList['Virtual Private network'] = [
      'Oh my... you are a great hacker as well.'
    ];
    chatList['Oh my... you are a great hacker as well.'] = [
      'Don\'t play with me!',
      'Told You...'
    ];
    chatList['It\'s true'] = ['Virtual Private network'];
    chatList['I\'ll know who you are (Lie)'] = ['What\'s my name?'];
    chatList['What\'s my name?'] = ['Peter(Guess)', 'Mark(Guess)'];
    chatList['Peter(Guess)'] = ['How do you Know?!'];
    chatList['How do you Know?!'] = [
      'Cause I already hacked you(Lie)',
      'I told you I am a great hacker (Lie)'
    ];
    chatList['Cause I already hacked you(Lie)'] = [
      'Oh my... you are a great hacker as well.'
    ];
    chatList['Don\'t play with me!'] = [
      'Please leave me alone I don\'t mean to hack you.'
    ];
    chatList['Please leave me alone I don\'t mean to hack you.'] = [
      '100\$',
      'oK'
    ];
    chatList['100\$'] = ['Ok Ok Just Leave me alone'];
    chatList['oK'] = ['Thank You Mister I am so Sorry'];
    chatList['Told You...'] = [
      'Please leave me alone I don\'t mean to hack you.'
    ];
    chatList['I told you I am a great hacker (Lie)'] = [
      'Please leave me alone I don\'t mean to hack you.'
    ];
    chatList['Mark(Guess)'] = ['How do you Know?!'];
    chatList['What do u want?'] = ['Send me 100\$ or you\'ll get hacked'];
    chatList['Do we Know eachother?'] = ['I\'m greatest hacker of all time'];

    return ChatLevel(
      levelName: 'Don\'t get hacked',
      botName: 'Hacker',
      botImg: 'assets/splash.jpg',
      userImg: 'assets/default.jpg',
      chatList: chatList,
      successMessages: [
        'I am Glad we made the deal',
        'Ok Ok Just Leave me alone',
        'Thank You Mister I am so Sorry',
      ],
      failureMessages: [],
    );
  }

  static ChatLevel level12() {
    Map<String, List<String>> chatList = Map();

    chatList[ChatLevel.BOT_KEY] = ['Booohooooo'];
    chatList['Booohooooo'] = ['Good evening Mr.Ghost', 'Hello.'];
    chatList['Hello.'] = ['Uhuuuuu'];
    chatList['Good evening Mr.Ghost'] = ['Uhuuuuu'];
    chatList['Uhuuuuu'] = ['What\'s wrong?', 'What do you want?'];
    chatList['What do you want?'] = ['Where are youhuuu?'];
    chatList['What\'s wrong?'] = ['Where are youhuuu?'];
    chatList['Where are youhuuu?'] = ['College', 'out of town'];
    chatList['College'] = ['When are you comming back home?'];
    chatList['out of town'] = ['When are you comming back home?'];
    chatList['When are you comming back home?'] = [
      'December',
      'Why do you care?'
    ];
    chatList['December'] = ['I miss youhuu'];
    chatList['Why do you care?'] = ['I miss youhuu'];
    chatList['I miss youhuu'] = ['Why?', 'Aww that\'s nice'];
    chatList['Why?'] = ['I have noone to scare.'];
    chatList['Aww that\'s nice'] = ['I have noone to scare.'];
    chatList['I have noone to scare.'] = [
      'You can scare my brother',
      'Find some other job'
    ];
    chatList['You can scare my brother'] = ['I don\'t like him'];
    chatList['Find some other job'] = ['What can ghost like me do?'];
    chatList['I don\'t like him'] = [
      'Do something else then',
      'Find some real job!'
    ];
    chatList['Do something else then'] = ['What can ghost like me do?'];
    chatList['Find some real job!'] = ['What can ghost like me do?'];
    chatList['What can ghost like me do?'] = [
      'Financial advisor',
      'You can star in movie'
    ];
    chatList['Financial advisor'] = [
      'Us ghosts don\'t know much about finance.'
    ];
    chatList['Us ghosts don\'t know much about finance.'] = [
      'I can teach you. I study finance in college'
    ];
    chatList['I can teach you. I study finance in college'] = [
      'That\'s good idea. When will you teach me?'
    ];
    chatList['That\'s good idea. When will you teach me?'] = [
      'I\'ll come home in december',
      'When I come home'
    ];
    chatList['I\'ll come home in december'] = ['Great news! Huaaaaah'];

    chatList['When I come home'] = ['Great news! Huaaaaah'];

    chatList['You can star in movie'] = ['I\'m scared of bright lights.'];
    chatList['I\'m scared of bright lights.'] = [
      'Face your fear!',
      'Don\'t be so soft'
    ];
    chatList['Face your fear!'] = [
      'You are right I have to come out of my comfort zone'
    ];
    chatList['You are right I have to come out of my comfort zone'] = [
      'That\'s the spirit!',
      'Yeah'
    ];
    chatList['That\'s the spirit!'] = [
      'Thanks the advice I am leading to hollywood'
    ];

    chatList['Yeah'] = ['Thanks the advice I am leading to hollywood'];

    chatList['Don\'t be so soft'] = [
      'You are right I have to come out of my comfort zone'
    ];

    return ChatLevel(
      levelName: 'Talk to your ghost',
      botName: 'Ghost',
      botImg: 'assets/splash.jpg',
      userImg: 'assets/default.jpg',
      chatList: chatList,
      successMessages: [
        'Thanks the advice I am leading to hollywood',
        'Great news! Huaaaaah',
      ],
      failureMessages: [],
    );
  }

  static ChatLevel level13() {
    Map<String, List<String>> chatList = Map();

    chatList[ChatLevel.USER_KEY] = ['Hi Felix!.', 'Hello.'];
    chatList['Hi Felix!.'] = ['Hi,what\'s up?'];
    chatList['Hi,what\'s up?'] = ['Can I borrow your car?'];
    chatList['Can I borrow your car?'] = ['Why?'];
    chatList['Why?'] = ['Mine is broken(Lie)', 'I crashed mine(Truth)'];
    chatList['Mine is broken(Lie)'] = ['Alright...Where do u want to take it?'];
    chatList['Alright...Where do u want to take it?'] = [
      'Paraguy(Truth)',
      'Just to NY and back(Lie)'
    ];
    chatList['Paraguy(Truth)'] = ['ARE You CRAZY?!.'];
    chatList['ARE You CRAZY?!.'] = [
      'Just Kidding.(Lie)',
      'I want to go on a roadtrip(Truth)'
    ];
    chatList['Just Kidding.(Lie)'] = ['Oh.I was legit scared.'];
    chatList['Oh.I was legit scared.'] = ['Would you borrow me the car?'];
    chatList['Would you borrow me the car?'] = [
      'OK. You have driving license, right?'
    ];
    chatList['OK. You have driving license, right?'] = [
      'Of course.',
      'No license at all.(Truth)'
    ];
    chatList['Of course.'] = ['Ok But Please Don\'t Scrach it'];
    chatList['No license at all.(Truth)'] = ['I won\'t borrow you my car'];
    chatList['I want to go on a roadtrip(Truth)'] = [
      'I won\'t borrow you my car'
    ];
    chatList['Just to NY and back(Lie)'] = [
      'OK. You have driving license, right?'
    ];
    chatList['I crashed mine(Truth)'] = [
      'Alright...Where do u want to take it?'
    ];
    chatList['Hello.'] = ['Hi,what\'s up?'];

    return ChatLevel(
      levelName: 'Borrow his car',
      botName: 'Felix',
      botImg: 'assets/splash.jpg',
      userImg: 'assets/default.jpg',
      chatList: chatList,
      successMessages: [
        'Ok But Please Don\'t Scrach it',
      ],
      failureMessages: ['I won\'t borrow you my car'],
    );
  }

  static ChatLevel level14() {
    Map<String, List<String>> chatList = Map();

    chatList[ChatLevel.BOT_KEY] = ['Gym. Tomorow.10 a.m.'];
    chatList['Gym. Tomorow.10 a.m.'] = ['I can\'t go.', 'I don\'t want to go.'];
    chatList['I can\'t go.'] = ['Why?'];
    chatList['I don\'t want to go.'] = ['Stop being lazy.'];
    chatList['Why?'] = [
      'I broke my arm(Lie)',
      'I lost my training shorts(Lie)'
    ];
    chatList['I broke my arm(Lie)'] = ['No problem.We can have leg day!.'];
    chatList['No problem.We can have leg day!.'] = [
      'I don\'t want to hit the gym.'
    ];
    chatList['I don\'t want to hit the gym.'] = ['Stop being lazy.'];
    chatList['Stop being lazy.'] = ['I\'m not lazy', 'I will go next week'];
    chatList['I\'m not lazy'] = ['Yes you are!'];
    chatList['Yes you are!'] = ['I\'m not', 'OK.Maybe a little bit'];
    chatList['I\'m not'] = ['Couch potato.'];
    chatList['Couch potato.'] = ['Stop it.', 'I will go next week'];
    chatList['Stop it.'] = ['Come and I\'ll stop'];
    chatList['Come and I\'ll stop'] = ['Ok...', 'I will come next week'];
    chatList['Ok...'] = ['Yaah see you tomorow'];
    chatList['I will go next week'] = ['No next week! Tomorrow'];
    chatList['No next week! Tomorrow'] = ['C\'mon!', 'Next Week or never'];
    chatList['C\'mon!'] = ['You\'ll never have muscles with this attitude.'];
    chatList['You\'ll never have muscles with this attitude.'] = [
      'Next week I promise',
      'I don\'t need them'
    ];

    chatList['Next week I promise'] = ['Ok lazy'];

    chatList['I don\'t need them'] = ['Everybody needs muscles!.'];
    chatList['Everybody needs muscles!.'] = [
      'I\'m not going alright',
      'Okay.I will go tomorrow'
    ];
    chatList['I\'m not going alright'] = ['Ok lazy'];
    chatList['Okay.I will go tomorrow'] = ['Yaah see you tomorow'];
    chatList['Next Week or never'] = ['Ok lazy'];
    chatList['OK.Maybe a little bit'] = ['Couch potato.'];

    chatList['I will come next week'] = ['No next week! Tomorrow'];

    chatList['I lost my training shorts(Lie)'] = ['I will borrow you mine'];
    chatList['I will borrow you mine'] = [
      'I only train in my shorts',
      'I don\'t want to hit the gym.'
    ];
    chatList['I only train in my shorts'] = ['why?.'];
    chatList['why?.'] = ['I\'m superstitious', 'Somtimes I pee myself'];
    chatList['I\'m superstitious'] = ['Uff ok'];
    chatList['Somtimes I pee myself'] = ['I did not need to know that'];

    return ChatLevel(
      levelName: 'Avoid gym',
      botName: 'Mathew Muscle',
      botImg: 'assets/splash.jpg',
      userImg: 'assets/default.jpg',
      chatList: chatList,
      successMessages: [
        'Uff ok',
        'Ok lazy',
      ],
      failureMessages: ['Yaah see you tomorow', 'I did not need to know that'],
    );
  }

  static ChatLevel level15() {
    Map<String, List<String>> chatList = Map();

    chatList[ChatLevel.BOT_KEY] = ['Hey, come over.'];
    chatList['Hey, come over.'] = ['What?', 'Where?'];
    chatList['What?'] = ['To the White House'];
    chatList['To the White House'] = ['I don\'t want to', 'For what'];
    chatList['I don\'t want to'] = [
      'I\'m having BBQ party with all the presidents'
    ];
    chatList['I\'m having BBQ party with all the presidents'] = [
      'I can\'t go',
      'I\'m not a president'
    ];
    chatList['I can\'t go'] = ['I order you!!'];
    chatList['I order you!!'] = ['Ok.MR.PRESIDENT', 'I\'m not comming...'];
    chatList['Ok.MR.PRESIDENT'] = ['I\'m sending a helicopter for you'];
    chatList['I\'m sending a helicopter for you'] = [
      'Sweet.',
      'Should I bring something?'
    ];

    chatList['Sweet.'] = ['Can you buy some ketchup along the way?'];

    chatList['Should I bring something?'] = [
      'Can you buy some ketchup along the way?'
    ];
    chatList['Can you buy some ketchup along the way?'] = [
      'No problem.',
      'I don\'t have money'
    ];

    chatList['No problem.'] = ['Nice helicopter will be there in 20 minutes'];

    chatList['I don\'t have money'] = ['Treasury will send you some'];
    chatList['Treasury will send you some'] = ['Ok', 'Alright'];

    chatList['Ok'] = ['Nice helicopter will be there in 20 minutes'];

    chatList['Alright'] = ['Nice helicopter will be there in 20 minutes'];
    chatList['I\'m not comming...'] = ['Pleaseee'];
    chatList['Pleaseee'] = ['No', 'Ok'];
    chatList['No'] = ['Whatever'];
    chatList['I\'m not a president'] = ['Really?.'];
    chatList['Really?.'] = ['I don\'t wana go', 'How do I get to Washington?'];
    chatList['I don\'t wana go'] = ['I order you!!'];
    chatList['How do I get to Washington?'] = [
      'I\'m sending a helicopter for you'
    ];
    chatList['For what'] = ['I\'m having BBQ party with all the presidents'];
    chatList['Where?'] = ['To the White House'];

    return ChatLevel(
      levelName: 'talk to president',
      botName: 'President',
      botImg: 'assets/splash.jpg',
      userImg: 'assets/default.jpg',
      chatList: chatList,
      successMessages: [
        'Nice helicopter will be there in 20 minutes',
        'Whatever',
      ],
      failureMessages: [],
    );
  }

  static void printUnreachableKeys() {
    allLevels().forEach((level) {
      final chatList = level.chatList;
      final allKeys = chatList.keys.toList();

      _printUnReachableKeys(level.willSenderInitiateChat ? BOT_KEY : USER_KEY,
          chatList, level, allKeys);
    });
  }

  static void _printUnReachableKeys(
      String root,
      Map<String, List<String>> chatList,
      ChatLevel level,
      List<String> allKeys) {
    if (level.isSuccessMessage(root)) {
      // print('success message hit: $root');
      return;
    } else if (level.isErrorMessage(root)) {
      // print('error message hit: $root');
      return;
    } else if (!allKeys.contains(root)) {
      print('key does not exist: ' + root);
      return;
    }

    final list = chatList[root];
    if (list == null) return;

    for (int i = 0; i < list.length; i++) {
      _printUnReachableKeys(list[i], chatList, level, allKeys);
    }
  }
}
