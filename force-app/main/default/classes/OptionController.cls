public class OptionController {
 public Option__c opts {get;set;}
 
 public Boolean f1             {get;set;}
 public Boolean f2             {get;set;}
 public Boolean f3             {get;set;}
 public Boolean f4             {get;set;}
 public Integer Counter        {get;set;}     
 public SObjectType      sobj  {get;set;}
 public String objName         {get;set;}
 
 public List<ObjectPermissions> objPerm {get;set;} 
    
    public OptionController(){
        objName = 'Candidate__c';
     opts = [SELECT Id,ExpenseSheet__c,OrderConsole__c,PaySlip__c,TimeSheet__c FROM Option__c WHERE User__r.id =: userinfo.getUserId() ];
     objPerm = [SELECT sObjectType FROM ObjectPermissions WHERE Parent.Profile.id =: userinfo.getProfileId()];
     
     Schema.SObjectType t1  = Schema.getGlobalDescribe().get(objName);
        Map<String, Schema.SObjectType> globalDescribeMap = Schema.getGlobalDescribe(); 
      Schema.DescribeSObjectResult sobj = globalDescribeMap.get(objName).getDescribe();

     // List<t1> ts = new  List<t1>();
        
   //  system.debug('** inside cons : = ' + sw);
     
     List<String> conCat = new  List<String>();
         List<Candidate__c> conCat1 = new  List<Candidate__c>();
     for(ObjectPermissions obj: objPerm){
          conCat.add(String.valueof(obj).split(',')[1]);
     }  
     
    //  Candidate__c.sObjectType.getDescribe().isAccessible();
     for(String ObjectName : conCat){
        if( ObjectName == 'Candidate__c' ){
        Schema.SObjectType t  = Schema.getGlobalDescribe().get(ObjectName);
       // Schema.sObjectType.getDescribe().ObjectName.isAccessible();
        //     Schema.SObjectType sobjType = (Schema.SObjectType)ObjectName;
           //  sobjType.sObjectType.getDescribe().isAccessible();
        }     
     }
    
    /* f1 = Schema.sObjectType.Test_Object__c.fields.field1__c.isAccessible();
     f2 = Schema.sObjectType.Test_Object__c.fields.field2__c.isAccessible();
     f3 = Schema.sObjectType.Test_Object__c.fields.field3__c.isAccessible(); */
     
    /* f1 = Schema.sObjectType.Option__c.fields.ExpenseSheet__c.isAccessible();
     f2 = Schema.sObjectType.Option__c.fields.OrderConsole__c.isAccessible();
     f3 = Schema.sObjectType.Option__c.fields.PaySlip__c.isAccessible();
     f4 = Schema.sObjectType.Option__c.fields.TimeSheet__c.isAccessible(); */
     
     
    }
}