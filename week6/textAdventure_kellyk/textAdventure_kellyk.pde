JSONObject json;
   
int state = 0;

Scene[] scenes;


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
  text(scenes[state].displayText, 40, 40, 350, 300); 
  
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
