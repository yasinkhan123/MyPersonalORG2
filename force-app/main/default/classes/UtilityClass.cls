public class UtilityClass {
public static string autoQuery(string objName){

Map <string, schema.SObjectField> mapname = schema.getGlobalDescribe().get(objName).getdescribe().fields.getmap();
string joinFields;
for(string count :mapname.keyset()){
    if (joinFields == null || joinFields == ''){
        joinFields = count;
    }else
    {
        joinFields = joinFields+','+count;
    }
    
}
return joinFields;
}
}