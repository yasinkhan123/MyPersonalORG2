@isTest // declare annotation i.e @isTest indicate we are writing a code for test class 
private class ComplexWrapperTestCase { //make class access specifier as private
    
    static testmethod void ComplexWrapperMeth(){    // Declare a testmethod i.e 
                                                    // static and testmethod - are keywords
                                                    // void method return type
                                                    // ComplexWrapperMeth() method return type
                                                                                                          
        Job_Application__c ja = new Job_Application__c(Cover_Letter__c  = 'test'); // before calling / creating controller testclass we need to 
        																		   // create a recods for all SOQL queries Example : (ComplexWrapper class Line No: 7)
        																		   // we need to add all required field names while creating a record (i.e Cover_Letter__c,Name, Candidate__c) 
        insert ja;        // insert ja indicate we are creating a new job application record
        ComplexWrapper CW = new ComplexWrapper(); //Now finally calling/ creating instance of a class 'ComplexWrapper'
    }    
}