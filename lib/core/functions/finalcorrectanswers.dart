int finalcorrectans(step, correctanswers){
             switch (step) {
             case 1:  { return correctanswers;}
             case 2:  { return (correctanswers/3*2).toInt();}
             case 3:  { return correctanswers~/2;}
             case 4:  { return (correctanswers/5*2).toInt();}
             default: return 0;
             
   
  }
}