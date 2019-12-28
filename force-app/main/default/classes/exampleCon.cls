public class exampleCon {

    public PageReference sayHello() {
        return null;
    }


    public exampleCon() {

    }

public Integer count = 0;
public List<Candidate__c> candidate{get;set;}
    public exampleCon(ApexPages.StandardController controller) {
                      candidate=[Select Id,first_Name__c From Candidate__c ];
                     
    }

   
                        
    public PageReference incrementCounter() {
           
            count++;
            system.debug('-- incrementCounter' +count);
            return null;
            
    }
                    
    public Integer getCount() {
        return count;
    }
    @RemoteAction
     public static Integer getCountscr() {
        system.debug('-- incrementCounter');
        return 123;//count;
    }
}