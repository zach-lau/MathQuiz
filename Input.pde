class Input extends Field{
  
  StringBuilder input;
  boolean enter;
  
  Input(int x, int y, int w, int h, int c){
    super(x,y,w,h,c);
    this.active = true;
    this.input = new StringBuilder();
    this.enter = false;
    this.active = true;
  }
  
  boolean enter(){return enter;}
  
  Input(int x, int y, int w, int h){
    this(x,y,w,h,color(255,255,255));
  }
  void interact(){
    if("0123456789".contains(String.valueOf(key)))
      input.append(key);
    else if(key == '-'){
      if(input.length() == 0)
        input.append(key);
    }
    else if(key == BACKSPACE){
      if(input.length() > 0)
        input.deleteCharAt(input.length()-1);
    }
    else if(key == ENTER){
      if(input.length() > 0){
         if(input.charAt(input.length()-1) != '-') //last char is not - 
           enter = true;
      }
    }
    this.text = input.toString();
  }
  
  void clear(){
    input.setLength(0);
    enter = false;
    this.text = input.toString();
  }
  
  void setEnter(boolean val){this.enter = val;}
  
}