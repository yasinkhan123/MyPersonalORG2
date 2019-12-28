public class UtillityClass {
    public static String allfields                          {get;set;}
    public static Map<String,Schema.SObjectField> fieldsMap {get;set;}     
    
    public UtillityClass(){
       allfields ='';
       fieldsMap = new Map<String,Schema.SObjectField>();
    }  
    public static String executeQuery(String objName,String relObjName){
        String objName1 = 'Job_Application__c';
        String relObjName1 = 'Candidate__c';
        String s  = 'Schema.sObjectType.'+objName1+'.fields.'+ relObjName1;
        Schema.DescribeFieldResult f = Schema.sObjectType.Job_Application__c.fields.Candidate__c;
		// System.debug(f.getRelationshipName()); 
        system.debug(s);
        return String.valueof(s);
    }
    
    public static String executeQuery(String objName) {
        fieldsMap = schema.getGlobalDescribe().get(objName).getDescribe().fields.getMap();

       for(String fieldName : fieldsMap.keySet()){
        if(allfields == null || allfields == '' ){
            allfields = fieldName;
        }else{
            allfields = allfields + ',' + fieldName ;
        }        
      }
       system.debug('d:'+allfields); 
        return 'yasin';
    }
    
   /* public static String executeQuery(String objName,String relObjName,String relObjName2,String relObjName3,String relObjName4,String relObjName5){
       Map<String,Schema.SObjectField> fieldsMap = schema.getGlobalDescribe().get(objName).getDescribe().fields.getMap();
       for(String fieldName : fieldsMap.keySet()){
        if(allfields == null || allfields == '' ){
            allfields = fieldName;
        }else{
            allfields = allfields + ',' + fieldName ;
        }        
       }
       system.debug('d:'+allfields); 
        return 'yasin';
    }
    */
}