public with sharing class check_get_set {

    public String check { get;set; }
    
    public String check1 {get; set;}
    
    public pageReference value()
    {
        check1 = check;
        return null;
    }
    
   
}