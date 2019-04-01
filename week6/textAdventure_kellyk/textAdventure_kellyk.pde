//I tried putting this below in the setup & global area & saved my json data file in a folder,
//but not sure why it doesn't work

  //JSONObject json;

  //json = loadJSONObject("data.json");
  
  //json = new JSONObject();
  
  //json.setString("descriptions");
  //json.setString("options");
  //json.setInt("optionTargets");
  
  


int state = 0;

String[] descriptions = {
  "You wake up in Code 2 class and don't know what is going on",
  "your eyelids feel so heavy, and you fail to wake up",
  "you feel enlightened by the answer, but still fall asleep",
  "your professor wakes you up, he says: give me an example of a datatype",
  "he starts chasing after you, the elevator door is about to close",
  "jokes on you, he made it on first floor before you through the stairs",
  "you both fall and go to the hospital",
};

String[][] options = { {"try to wake up", "ask a question"},
                       {"you sleep"},
                       {"struggle to stay awake", "enjoy the sweet surrender of sleep"},
                       {"boolean", "walk out the classroom"},
                       {"go back to class", "press 'door close' while you give an evil laugh"},
                       {"apologize", "kick the bucket of water next to you to make him fall"},
                       {"start over"},

};

int[][] optionTargets = {
  {1, 2},
  {0},
  {0, 3},
  {0, 4},
  {0, 5},
  {0, 6},
  {0}
};

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  textSize(40);
  fill(0);
  text(descriptions[state], 40, 40, 350, 300); //calling string, starts with 0
  
  textSize(18);
  int i = 0;
  for (String option : options[state]) {
    text(option, 40, 450 + i * 50); 
    i++;
  }
}

void keyPressed() {
  
  for (int i = 0; i < optionTargets[state].length; i++) {
    if (keyCode - 49 == i) {
       state = optionTargets[state][i];
    }
  }
}
