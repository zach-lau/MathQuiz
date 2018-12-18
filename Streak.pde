class Streak extends Field{
    
  int streak; //current streak
  
  Streak(int x, int y, int w, int h, int c){
    super(x,y,w,h,c);
    this.active = false;
    reset();
  }
  
  Streak(int x, int y, int w, int h){
    this(x,y,w,h,color(255,255,255));
  }
  
  void interact(){}//this could be unnecessary if we divide fields into active and passive}
   
  void increment(){streak++; this.text = "Streak: " + Integer.toString(streak);}
  void decrement(){streak--; this.text = "Streak: " + Integer.toString(streak);}
  void reset(){streak = 0; text = "Streak: " + Integer.toString(streak);}
  void set(int s){streak = s; text = Integer.toString(s);}
}