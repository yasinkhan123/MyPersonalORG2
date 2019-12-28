public class ComplexWrapper {

public list<Job_Application__c> JobApp {get; set;}
public list <JobAppWrapper> wrapperHolder {get; set;}
public ComplexWrapper (){
wrapperHolder = new list <JobAppWrapper>();
JobApp= [Select id, Name, Average_Rating__c, Number_of_Reviews__c, Position__c 
            From Job_Application__c];
            Integer cnt= 0;
            for (Job_Application__c counter: JobApp){
           // JobAppWrapper singleWrapperForEachRecord = new JobAppWrapper(counter);
            wrapperHolder.add(new JobAppWrapper(counter, ++cnt));
                        
            }
}

public class JobAppWrapper{
public Job_Application__c Ja {get; set;}
public Integer slNo {get; set;}
public JobAppWrapper (Job_Application__c v1, Integer num){
this.Ja=v1;
this.slNo= num;

}
}

}