import 'dart:html';

List<Map<String, dynamic>> studentprofile = [
  {
    'Student Name': 'Student 1',
    'Student Roll#': 1001,
    'Semester': 'First',
    'Faculty': 'BSCS',
    'Student Email': 'admin',
    'Student Contact': '+92-335-1234567',
    'Student Address':
        'plot no 123, Block x, Falana gali, dhimkana nagar, Karachi',
    'Student Result': 'A Grade',
    'Student Assignment': '5 Out of 6 submitted',
  },
  {
    'Student Name': 'Student 2',
    'Student Roll#': 1002,
    'Semester': 'Fourth',
    'Faculty': 'BSCS',
    'Student Email': 'Student2@gmail.com',
    'Student Contact': '+92-335-1234567',
    'Student Address':
        'plot no 121, Block x, Falana gali, dhimkana nagar, Karachi',
    'Student Result': 'B Grade',
    'Student Assignment': '4 Out of 6 submitted',
  },
  {
    'Student Name': 'Student 3',
    'Student Roll#': 1003,
    'Semester': 'Third',
    'Faculty': 'BBA',
    'Student Email': 'Student3@gmail.com',
    'Student Contact': '+92-335-1234567',
    'Student Address':
        'plot no 122, Block x, Falana gali, dhimkana nagar, Karachi',
    'Student Result': 'C Grade',
    'Student Assignment': '3 Out of 6 submitted',
  }
];

void main() {
  studentLogin();
}

void studentLogin() {
  DivElement outputElement = querySelector('#output')! as DivElement;
outputElement.text = ''; // Clear the existing text content
outputElement.innerHtml = '''
  
      <header>Login Form</header>
      <div>
        <div class="field">
          <span class="fa fa-user"></span>
          <input type="text" required placeholder="Email">
        </div>
        <div class="field space">
          <span class="fa fa-lock"></span>
          <input type="password" class="pass-key" required placeholder="Password">
        </div>
        <br>
        <div class="field">
          <input type="submit" value="LOGIN" id="login">
        </div>
      </div>
   
''';

querySelector('#login')!.onClick.listen((MouseEvent event) {
  InputElement? emailInput = querySelector('input[type="text"]') as InputElement?;
  InputElement? passwordInput = querySelector('.pass-key') as InputElement?;

  String enteredEmail = emailInput?.value ?? '';
  String enteredPassword = passwordInput?.value ?? '';

  if (checkCredentials(enteredEmail, enteredPassword)) {
    outputElement.text = 'User login successful.';
    showOptions(enteredEmail);
  } else {
    outputElement.text = 'Incorrect email or password. Please try again.';
    outputElement.style.color = "white";
    Future.delayed(const Duration(seconds: 1), () {
      studentLogin();
    });
  }

});



}

bool checkCredentials(String enteredEmail, String enteredPassword) {
  List<Map<String, String>> userCredentials = [
    {"email": "admin", "password": "1234"},
    {"email": "Student2@gmail.com", "password": "5678"},
    {"email": "Student3@gmail.com", "password": "1122"},
  ];

  return userCredentials.any((credentials) =>
      credentials["email"] == enteredEmail &&
      credentials["password"] == enteredPassword);
}
void showOptions(String enteredEmail) {
  var outputElement = querySelector('#output')!;
  outputElement.text = ''; // Clear the existing text content
  outputElement.innerHtml = '''
        <div class="options">
          <div class="firstrow">
              <div class="firstoption" id="studentProfile">
                  <span>
                      Student Profile
                  </span>
              </div>
              <div class="secondoption" id="assignment">
                  <span>
                      Assignment
                  </span>
              </div>
          </div>
          <div class="secondrow">
             <div class="thirdoption" id="result">
              <span>
                  Result
              </span>
             </div>
             <div class="fourthoption" id="return">
              <span>
                  Return
              </span>
             </div>
          </div>
        </div>
  ''';

  // Add event listeners for the div options
  querySelector('#studentProfile')?.onClick.listen((MouseEvent event) {
    displayStudentProfile(enteredEmail);
  });

  querySelector('#assignment')?.onClick.listen((MouseEvent event) {
    displayStudentAssignment(enteredEmail);
  });

  querySelector('#result')?.onClick.listen((MouseEvent event) {
    displayStudentResult(enteredEmail);
  });

  querySelector('#return')?.onClick.listen((MouseEvent event) {
    var outputHtml = '<p class="returning">Returning to the main menu</p>';
      outputElement.innerHtml = outputHtml;
    Future.delayed(const Duration(seconds: 1), () {
      studentLogin();
    });
  });
}




void displayStudentProfile(String enteredEmail) {
  var outputElement = querySelector('#output')!;

  for (var profile in studentprofile) {
    if (profile['Student Email'] == enteredEmail) {
      var outputHtml = '<div class="container">'
                       '<h2>Student Profile</h2>'
                       '<ul class="responsive-table">';
                       
      profile.forEach((key, value) {
        outputHtml += '<li class="table-row">'
                      '<div class="col col-1" data-label="Attribute">$key</div>'
                      '<div class="col col-2" data-label="Value">$value</div>'
                      '</li>';
      });
      outputHtml += '</ul>'
      '<button class="back">Back</button>'
      '</div>';
      outputElement.innerHtml = outputHtml;
      querySelector('.back')?.onClick.listen((MouseEvent event) {
        //outputElement.text = "Returning to the main menu.";
        outputHtml = '<p class = "returning">Returning to the main menu</p>';
        outputElement.innerHtml = outputHtml;
         Future.delayed(const Duration(seconds: 1), () {
      showOptions(enteredEmail);
    });
      });
    }
  }

}

void displayStudentAssignment(String enteredEmail) {
  var outputElement = querySelector('#output')!;
  for (var profile in studentprofile) {
    if (profile['Student Email'] == enteredEmail) {
      var outputHtml = '<p class="assignment">Result: ${profile['Student Assignment']}'; 
      outputHtml += '</p>';
      outputHtml += '<button class="back">Back</button>';
      outputElement.innerHtml = outputHtml;
      break;
    }
  }
  querySelector('.back')?.onClick.listen((MouseEvent event) {
    var outputHtml = '<p class="returning">Returning to the main menu</p>';
      outputElement.innerHtml = outputHtml;
    Future.delayed(const Duration(seconds: 1), () {
      showOptions(enteredEmail);
    });
  });
}

void displayStudentResult(String enteredEmail) {
  var outputElement = querySelector('#output')!;
  for (var profile in studentprofile) {
    if (profile['Student Email'] == enteredEmail) {
      var outputHtml = '<p class ="returning">Result: ${profile['Student Result']}'; 
  outputHtml += '</p>';
  outputHtml += '<button class="back">Back</button>';
      outputElement.innerHtml = outputHtml;
      break;
    }
  }
  querySelector('.back')?.onClick.listen((MouseEvent event) {
    var outputHtml = '<p class="returning">Returning to the main menu</p>';
    outputElement.innerHtml = outputHtml;
         Future.delayed(const Duration(seconds: 1), () {
      showOptions(enteredEmail);
    });
      });
}
