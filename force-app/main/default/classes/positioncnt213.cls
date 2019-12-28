public class positioncnt213 {

   public positioncnt213(){
   
      String obj = 'Job_Application__c';

      Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
      Schema.SObjectType sobjType = gd.get(obj); 
      Schema.DescribeSObjectResult describeResult = sobjType.getDescribe(); 
      Map<String,Schema.SObjectField> fieldsMap = describeResult.fields.getMap();
   
   }
}