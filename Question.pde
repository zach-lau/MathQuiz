class Question extends Field{
  
    Type type;
    int first;
    int second;
    int answer;
    
    Question(int x, int y, int w, int h, int c, Type type){
      super(x,y,w,h, c);
      this.active = false;
      this.type = type;
    }

   private void makeString(String operation){
     this.text = Integer.toString(this.first) + " " + operation + " " + Integer.toString(second) + " = ?";
   }
   
   void interact(){}
   int answer(){return answer;}
   
   void refresh(int first, int second){
     this.first = first;
     this.second = second;
      
      switch(type){
        case ADDITION:
          answer = first+second;
          makeString("+");
        break;
        case SUBTRACTION:
          answer = first-second;
          makeString("-");
        break;
        case MULTIPLICATION:
          answer = first*second;
          makeString("x");
        break;
        case DIVISION:
          answer = first/second;
          makeString("/");
        break;
        case OTHER:
          this.text = "Not implemented";
        break;
        default:
          throw new java.lang.RuntimeException("Invalid Type");
      }
   }
}