abstract class Field{
  int x,y,w,h; //position width and height
  boolean active; //if this field is active
  color background; 
  String text;
  ArrayList<Field> subfields;
  
  Field(int x, int y, int w, int h, String text){
    this.x = x; this.y = y; this.w = w; this.h = h; this.text = text; this.active = true; this.subfields = new ArrayList(0);
  }
  
  Field(int x, int y, int w, int h){
    this(x,y,w,h,"");
  }
  
  Field(int x, int y, int w, int h, int c){
    this(x,y,w,h);
    background = c;
  }
  
  void display(){
    fill(background);
    rect(x,y,w,h);
    fill(0);
    text(text,x+w/2,y+h/2);
    for(Field subfield : subfields){
      subfield.display();
    }
  }
  
  void interact(){
    for(Field sub : subfields){
      if(sub.active)
        sub.interact();
    }
  }
  
}