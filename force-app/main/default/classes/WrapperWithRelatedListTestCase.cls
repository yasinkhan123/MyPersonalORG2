@isTest // declare annotation i.e @isTest indicate we are writing a code for test class 
public class WrapperWithRelatedListTestCase { //make class access specifier as private
   
    static testmethod void WrapperWithRelatedListMeth(){    // Declare a testmethod i.e 
                                                    		// static and testmethod - are keywords
                                                    		// void method return type
                                                    		// ComplexWrapperMeth() method return type
    
           // Note: We have two soql queries in WrapperWithRelatedList controller
           // so we have to create both position and job application record
           // We first we need to reterive a record type before creating a position record 

        RecordType rt = [SELECT Id FROM RecordType WHERE SObjectType='positions__c' AND Name='Standard Position' LIMIT 1]; //we need to specify recordtype name and object name of tht record type
        
        // creating position record
        positions__c pos = new positions__c(Name = 'test', RecordTypeId = rt.Id); // if we want we can add more fields also but required fields are mandatory  
        insert pos; // means creating or inserting a new record
        
        // creating job application record
        Job_Application__c ja = new Job_Application__c(Cover_Letter__c  = 'test'); // if we want we can add more fields also but required fields are mandatory  
        insert ja; // means creating or inserting a new record
        
        										// before calling / creating controller instance we need to 
        										// create a recods for all SOQL queries Example : (ComplexWrapper class Line No: 10 and 16)
        										// we need to add all required field names while creating a record (i.e Cover_Letter__c,Name, Candidate__c) 
      
        WrapperWithRelatedList WRL = new WrapperWithRelatedList(); // calling a constructor of WrapperWithRelatedList class
        WRL.posid = pos.id; // assigning a created postion record id to a variable (posid)
        WRL.getPosOnClk(); // calling a method i.e getPosOnClk
    } 
 
}