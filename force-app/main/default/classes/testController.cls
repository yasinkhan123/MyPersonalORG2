public class testController {

  
         List <Integer> my_List =new List<Integer>{1,2,3};         
         Set<String> my_Set=new Set<String>{'yasin'.toUppercase(), 'khan'.toUppercase()};  
         Map<Integer,String> my_Map=new Map<Integer,String>{1=>'apex',2=>'cloud'};
         
         
         
    public List<Integer> getTresult() {
        return my_List;
    } 
    
    public Set<String> getTSstrresult(){
           return my_Set;
    }
    
    public Map<Integer,String> getTmapresult(){
           return my_Map;
    }
    
    
}