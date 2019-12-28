public class CustomSQLUtil {
    static Map <string, schema.SObjectField> mapname;
    static Integer mapTrace = 0;
    static String completeSOQL = '';
            
    /* fetch all fields for multiple objects with omitFields */
    public static String getCustomSQLQuery(Map <string, string> childObjects, Set<String> filterFields){
         for(String objectKey: childObjects.keySet()){
                mapname = schema.getGlobalDescribe().get(objectKey).getdescribe().fields.getmap();  
                completeSOQL = (mapTrace == 0)? formSQLQuery(mapname,filterFields,mapTrace,childObjects.get(objectKey)) : completeSOQL +','+ formSQLQuery(mapname,filterFields,mapTrace,childObjects.get(objectKey));
                mapTrace++;
         }           
         return completeSOQL;
     }
     
     /* multiple objects fields concatinations */   
     public static String formSQLQuery(Map <string, schema.SObjectField> mapnameDescribe, Set<String> filterField,Integer options,String childFieldsName){
        string joinFields;
        Set<String> filterFields = new Set<String>();
        for(String fieldTrace: filterField)
            filterFields.add(fieldTrace.toLowerCase());
                    
        for(string fields :mapnameDescribe.keyset()){
                    if (joinFields == null || joinFields == ''){
                       if(!filterFields.contains(childFieldsName.toLowerCase() + fields))
                            joinFields = (options == 0)? fields : childFieldsName + fields;
                    }else{
                       if(!filterFields.contains(childFieldsName.toLowerCase() + fields))    
                            joinFields = (options == 0)? (joinFields+','+fields) : ((joinFields + ',' + childFieldsName + fields));
                    }   
        }
        return joinFields;      
      }  
      
      /***** Execution Process *******/   
      
      /*
            Map <string, string> childObjects = new Map <string, string>();
            childObjects.put('Job_Application__c','Job_Application__c');
            childObjects.put('Candidate__c','Candidate__r.');
            childObjects.put('Positions__c','Position__r.');
            Set <string> s = new Set<string>();
            s.add('Candidate__r.Last_Name__c');
            String cusSQL = CustomSQLUtil.getCustomSQLQuery(childObjects,s);
            String cusSQL2 ='SELECT '+ cusSQL+ ' FROM Job_Application__c LIMIT 1';
            Job_Application__c ja = Database.query(cusSQL2);   
            system.debug('cusSQL2 :'+ja);
      */
}