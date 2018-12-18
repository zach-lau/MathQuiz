enum Type {ADDITION, SUBTRACTION, MULTIPLICATION, DIVISION, OTHER};

class Game extends Field{
  
  Type type; //multiplication addition subtraction division or other
  int min1, max1; //min and max for the first arg
  int min2, max2; //min and max for the sceond arg
  
  Input input;
  Question question;
  Streak streak;

  Game(int x, int y, int w, int h, String type, int min1, int max1, int min2, int max2){
    super(x,y,w,h);

    this.min1 = min1;
    this.min2 = min2;
    this.max1 = max1;
    this.max2 = max2;
    
    switch(type){
      case "ADDITION":
        this.type = Type.ADDITION;
        break;
      case "SUBTRACTION":
        this.type = Type.SUBTRACTION;
        break;
      case "MULTIPLICATION":
        this.type = Type.MULTIPLICATION;
        break;
      case "DIVISION":
        this.type = Type.DIVISION;
        break;
      case "OTHER":
        this.type = Type.OTHER;
        break;
      default:
        throw new java.lang.RuntimeException("Invalid type");
    }   
    
    this.input = new Input(x+w/4,y+h/2,w/2,h/5); //make the input field
    streak = new Streak(x+w/20,y+h/20,w*2/5,h/10); //make the streak field and set to 0
    this.question = new Question(x+w/4,y+h/5,w/2,h/5,color(255,255,255),this.type); //make the questionfield
    newQuestion();
    
    this.subfields.add(this.input);
    this.subfields.add(this.streak);
    this.subfields.add(this.question);
    
  }
  
  Game(String type, int min1, int max1, int min2, int max2){
    this(0,0,width,height,type,min1,max1,min2,max2);
  }
  
  Game(int x, int y, int w, int h, String type, int max1, int max2){
    this(x,y,w,h,type,0,max1,0,max2);
  }
  
  Game(String type, int max1, int max2){
    this(0,0,width,height,type,0,max1,0,max2);
  }
  
  void interact(){
    super.interact();
    if(input.enter()){
      
      int userIn = Integer.parseInt(input.input.toString());
      
      if(userIn == question.answer()){
        newQuestion();
        streak.increment();
        input.clear();
        System.out.println(input.input.toString());
      }
      else{
        streak.reset();
        input.setEnter(false);
      }
    } 
  }
  
  void newQuestion(){
    int first = int(random(min1,max1));
    int second = int(random(min2,max2));
    if(this.type == Type.DIVISION){
      while(second == 0 || first % second != 0){
        first = int(random(min1,max1));
        second = int(random(min2,max2));        
      }
    }
    question.refresh(first,second);
  }
  
}