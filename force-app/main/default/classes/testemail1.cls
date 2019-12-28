public class testemail1 {

    public testemail1(ApexPages.StandardController controller) {

    }


public Contact con{get;set;}
public testemail1()
{
//this.con=(Contact)controller.getRecord();
}

public void SendEmail()
{
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
//mail.setTargetObjectId(con.Id);
//mail.setTemplateId('00X90000000QHUD');
//Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
}