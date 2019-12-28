global class EmailToApex implements Messaging.InboundEmailHandler {
public static String getFieldValue(String plainTextBody, String pLabel) {
Integer startPos = plainTextBody.indexOf(pLabel);
Integer endPos = plainTextBody.indexOf('\n');
return plainTextBody.substring(startPos+pLabel.length(), endPos);
}
global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email,
Messaging.InboundEnvelope envelope) {
Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
String contactName =email.subject;
Double mileageInt = Double.valueOf(getFieldValue(email.plainTextBody, 'Mileage:'));
List<Contact> contactResult = new List<Contact>();
contactName = '%'+contactName+'%';
Mileage__c[] newMileage = new Mileage__c[0];
try {
for (Contact c :
[Select Id, Name, Email From Contact Where Name like :contactName Limit 1]) {
newMileage.add(new Mileage__c(miles__c = mileageInt, Contact__c = c.Id));
}
insert newMileage;
} catch (System.Exception e) {
System.debug('Error: ' + e);
}
result.success = true; // If false, an email can be sent back with a message.
return result;
}
}