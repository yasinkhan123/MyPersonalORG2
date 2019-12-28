public class Scheduler_class implements Schedulable{

    public static String sched = '0 0 15 * * ?';  

    public static String scheduleMe() {
        Scheduler_class SC = new Scheduler_class(); 
        return System.schedule('My batch Job', sched, SC);
    }

    public void execute(SchedulableContext sc) { 
            system.debug('*** scheduler');
            List<Account > acclist = [Select id,name , CreatedDate , lastModifiedDate from Account limit 10];
            string header = 'Record Id, Name , Created Date, Modified Date \n';
            string finalstr = header ;
            
            for(Account a: acclist)
            {
                   string recordString = a.id+','+a.Name+','+a.CreatedDate+','+a.LastModifiedDate +'\n';
                   finalstr = finalstr +recordString;
            }
            Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
            blob csvBlob = Blob.valueOf(finalstr);
            string csvname= 'Account.csv';
            csvAttc.setFileName(csvname);
            csvAttc.setBody(csvBlob);
            Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
            String[] toAddresses = new list<string> {'yasin.khan@aqxolt.com'};
            String subject ='Account CSV';
            email.setSubject(subject);
            email.setToAddresses( toAddresses );
            email.setPlainTextBody('Account CSV ');
            email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
            Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});          
    }
}