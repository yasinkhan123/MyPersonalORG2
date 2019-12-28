public class positioncnt212 {
  public Map<String, Schema.SObjectType> schemaMap;
  public List<Positions__c> pos{get;set;}
   public positioncnt212(){
        
         schemaMap = Schema.getGlobalDescribe();
         String queryFields = fetchAllFields('Positions__c');
         String query = 'select ' + queryFields + ' from Positions__c '; //where Id =: expId
          pos =   Database.query(query);
   }
 
   public String fetchAllFields(String sObj){
        // Map<String, Schema.SObjectField> fieldMap = schemaMap.get(sObj).getDescribe().fields.getMap();   
        
        Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
        Schema.SObjectType sobjType = gd.get(sObj); 
        Schema.DescribeSObjectResult describeResult = sobjType.getDescribe(); 
        Map<String,Schema.SObjectField> fieldMap = describeResult.fields.getMap();
      
        String allFields = '';
        for(String fieldName : fieldMap.keyset()){
            if(allFields == null || allFields == ''){
                allFields = fieldName;
            }else{
                allFields = allFields + ', ' + fieldName;
            }
        }
        return allFields;
    }
    
    public void checkValueForXpathInjection(String value){
    boolean isValid = true;
    if (value != null) {
        String xpathCharList =' ()=[]:,*" / ';
  
      //String decodedValue = String.value();
        /* for (String v : decodedValue) {
            if (xpathCharList.indexOf(c) != -1) {
                isValid = false;
                break;
            }
        } */
    }
    
} 
 
}