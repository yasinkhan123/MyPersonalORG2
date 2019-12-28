public class Positionpagecontroller3 {

        public boolean Boo              {get;set;}
        public boolean Boo1              {get;set;}

        public Positions__C pos         {get;set;} 

    public void showDisplay() {
       boo = true;
       //boo1 = false;
    }

    public void showPosition(){
    pos = [SELECT id, name 
            FROM Positions__C Limit 1];
            boo = false;
           // boo1 = true;
    }
    public Positionpagecontroller3 (){
    boo = false;
     //boo1 = false;
    }
}