import Sys;

class Main {
  static public function main():Void {
    var chaine = "portez ce vieux wisky au juge blond qui fume";
    var mape:Map<String,Int> = new Map<String, Int>();

    for(char in chaine.split("")) {
      if(mape.exists(char)) {
        mape[char] += 1;
      }
      else {
        mape[char] = 1;
      }
    }

    Sys.print('dans la chaine "${chaine}"\n');
    for(key in mape.keys()) {
      Sys.print('Le cacactere ${key} est present ${mape[key]} fois\n');
    }
  }
}
