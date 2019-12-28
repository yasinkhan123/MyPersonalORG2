public class ManageJobApplication1 {

     public ManageJobApplication1(ApexPages.StandardController controller){
    } 
    
    @RemoteAction
    public static Boolean refresh(string s){
        
        // Your business logic
        
        return true;
    }
}