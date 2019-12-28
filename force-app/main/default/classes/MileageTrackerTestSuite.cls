@isTest
private class MileageTrackerTestSuite {
static TestMethod void runPostiveTestCases(){
Double totalMiles = 0;
final Double maxtotalMiles= 500;
final Double singletotalMiles= 300;
final String createdbyId = UserInfo.getUserId();
List<Mileage__c> deleteMiles = new List<Mileage__c>();
// Data clean-up
System.debug('Setting up testing - deleting any mileage records for today');
deleteMiles = [select miles__c from Mileage__c where createdDate = TODAY
and createdById = :createdbyId];
if(!deleteMiles.isEmpty()){
delete deleteMiles;
}
// Positive tests
System.debug('Inserting 300 miles...');
Mileage__c testMiles1 = new Mileage__c(Miles__c = 300, Date__c = System.today() );
insert testMiles1;
// Validate single insert
for(Mileage__c m:[SELECT miles__c FROM Mileage__c
WHERE createdDate = TODAY
and createdById = :createdbyId
and miles__c != null]) {
totalMiles += m.miles__c;
}
System.assertEquals(singletotalMiles, totalMiles);
totalMiles = 0;
// Validate bulk insert
System.debug('Inserting 200 more miles...bulk validation');
List<Mileage__c> testMiles2 = new List<Mileage__c>();
for(integer i=0; i<200; i++){
testMiles2.add( new Mileage__c(Miles__c = 1, Date__c = System.today()) );
}
insert testMiles2;
// Assert Mileage
for(Mileage__c m:[SELECT miles__c FROM Mileage__c
WHERE createdDate = TODAY
and createdById = :createdbyId
and miles__c != null]) {
totalMiles += m.miles__c;
}
System.assertEquals(maxtotalMiles, totalMiles);
}
// Negative tests
static testMethod void runNegativeTestCases(){
System.debug('Inserting 501 miles... negative test case');
Mileage__c testMiles3 = new Mileage__c(Miles__c = 501, Date__c = System.today());
// Assert Error Message
try {
insert testMiles3;
} catch (DmlException e) {
// Assert Error Message
System.assert(e.getMessage().contains('Insert failed. '+
'First exception on row 0; first error: ' +
'FIELD_CUSTOM_VALIDATION_EXCEPTION, '+
'Mileage request exceeds daily limit(500): [Miles__c]'),
e.getMessage());
// Assert Field
System.assertEquals(Mileage__c.Miles__c, e.getDmlFields(0)[0]);
// Assert Status Code
System.assertEquals('FIELD_CUSTOM_VALIDATION_EXCEPTION',
e.getDmlStatusCode(0));
}
}
}