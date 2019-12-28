public class wrapperClassController {

 public List<wrapperContact> wrapperContactList {get; set;}
 public List<Account> acc {get; set;} 
 public wrapperClassController(){
     
 }
 public List<wrapperContact> getContact(){ 
   system.debug('-- outside query');   
      if( wrapperContactList == null ){  
         system.debug('-- inside query');  
           wrapperContactList = new List<wrapperContact> ();            
            for(Account ac: [select Id, Name, Phone from Account limit 10]){
                wrapperContactList.add(new wrapperContact(ac));   
            }      
      }
      return wrapperContactList; 
 }   
 public PageReference getSelectedAccount(){
         acc = new List<Account>();         
         for(wrapperContact wc: getContact()){
                   system.debug('-- counter k :');
                  if(wc.selected == true){
                     acc.add(wc.con);
                  }
         }
         
         for(Account ac1: acc){
            system.debug('-- selected account act1 :'+ac1);
         }
         acc = null;
         return null;
 } 
 
 public class wrapperContact{
      public Account con {get;set;}
      public Boolean selected {get;set;}
      
      public wrapperContact(Account ccon){ 
         con = ccon;  
         selected = false;
       
      }
 }
 

}