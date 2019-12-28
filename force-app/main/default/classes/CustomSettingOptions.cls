public class CustomSettingOptions {
   public UserOptionVisiblity__c mc {get;set;}
   String profileId              {get;set;}
   public List<ObjectPermissions> objpermission  {get;set;}
   public List<String> ListOfObj                 {get;set;}
   public List<String> Objnm {get;set;}
   public CustomSettingOptions(){
         objpermission = new List<ObjectPermissions>();
         ListOfObj = new List<String>();
         Objnm = new List<String>(); 
         UserOptionVisiblity__c []uov = [SELECT Expenses__c,TimeSheet__c,setupOwnerId FROM UserOptionVisiblity__c];
         //mc = UserOptionVisiblity__c.getInstance(userinfo.getProfileId());
         profileId = String.valueof(mc); //WHERE Parent.Profile.Id =: profileId 
         objpermission   = [ SELECT SObjectType FROM ObjectPermissions WHERE Parent.Profile.Id =: UserInfo.getProfileId() ]; 
         
       for(ObjectPermissions objId: objpermission){ 
            String Objname = String.valueof(objId);
            Objnm = Objname.split(','); 
            ListOfObj.add(Objnm[1]);              
       }    
   }
}