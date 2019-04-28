//I tried putting this below in the setup & global area & saved my json data file in a folder,
//but not sure why it doesn't work

JSONObject json;
   
int state = 0;

Scene[] scenes;

//String[] descriptions = {
//  "You wake up in Code 2 class and don't know what is going on",
//  "your eyelids feel so heavy, and you fail to wake up",
//  "you feel enlightened by the answer, but still fall asleep",
//  "your professor wakes you up, he says: give me an example of a datatype",
//  "he starts chasing after you, the elevator door is about to close",
//  "jokes on you, he made it on first floor before you through the stairs",
//  "you both fall and go to the hospital",
//};

//String[][] options = { {"try to wake up", "ask a question"},
//                       {"you sleep"},
//                       {"struggle to stay awake", "enjoy the sweet surrender of sleep"},
//                       {"boolean", "walk out the classroom"},
//                       {"go back to class", "press 'door close' while you give an evil laugh"},
//                       {"apologize", "kick the bucket of water next to you to make him fall"},
//                       {"start over"},

//};

//int[][] optionTargets = {
//  {1, 2},
//  {0},
//  {0, 3},
//  {0, 4},
//  {0, 5},
//  {0, 6},
//  {0}
//};

void setup() {
  size(600, 600);
  
  json = new JSONObject();
  
  json = loadJSONObject("data.json");
  
  JSONArray descriptions = json.getJSONArray("descriptions");
  JSONArray options = json.getJSONArray("options");
  JSONArray optionTargets = json.getJSONArray("optionTargets");
 
 scenes = new Scene[descriptions.size()];
 
 for (int i = 0; i < scenes.length; i++) {
   scenes[i] = new Scene(descriptions.getString(i), options.getJSONArray(i), optionTargets.getJSONArray(i));
 }
}


void draw() {
  background(255);
  textSize(40);
  fill(0);
  text(scenes[state].displayText, 40, 40, 350, 300); //calling string, starts with 0
  
  textSize(18);
  for (int i = 0; i < scenes[state].options.size(); i++) {
    text( i + 1, 30, 450 + i * 50);
    text(scenes[state].options.getString(i), 70, 450 + i * 50);
  }
}

void keyPressed() {
  for (int i = 0; i < scenes[state].optionTargets.size(); i++) {
    if (keyCode - 49 == i) {
       state = scenes[state].optionTargets.getInt(i);
    }
  }
}

class Scene {
  String displayText;
  JSONArray options;
  JSONArray optionTargets;
  
  Scene(String txt, JSONArray opt, JSONArray targets) {
    displayText = txt;
    options = opt;
    optionTargets = targets;
  }
}
