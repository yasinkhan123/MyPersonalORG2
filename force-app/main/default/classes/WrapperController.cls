public class WrapperController {
public List <Positions__c> Pos    {get;set;}
public List <PositionWrapper> WrapList  {get;set;} 


    public WrapperController(){ 
  Pos = [Select name, id From Positions__C];
  WrapList = new List <PositionWrapper>();
  system.debug('List of Postions:'+ Pos);
  for (Positions__c counter: pos ){
  PositionWrapper PosWrap = new PositionWrapper();          //creating single wrapper with a reference name PosWrap; PosWrap isa reference variable which holds both Position name and Id
  PosWrap.Name = counter.name;                                //variables of PosWrap wrapper name and id 
  PosWrap.id = counter.id;
  WrapList.add(PosWrap);                                        //WrapList is a container which holds all the wrapers i.e, PosWrap; PosWrap holds single position record for each iterration
  }
        }
        /*begining of wrapper class decleration*/
        
public class PositionWrapper {
public string name {get;set;}                 //name and id are wrapper class properties/variables
public string id  {get;set;}
    public PositionWrapper (){        //Constructor
    
    }
}

}