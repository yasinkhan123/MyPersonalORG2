public with sharing class homeController {
  public User usr {get;set;}  
    
    public homeController(){
      
        usr = [Select SmallPhotoUrl, name, FullPhotoUrl From User Where Id =: UserInfo.getUserId() limit 1];
            system.debug('-- user list:'+usr); 
            
           // update usr; 
    } 
    
    public void UploadAttachment(){
       system.debug('done');
    }
}