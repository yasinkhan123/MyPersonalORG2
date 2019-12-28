public with sharing class SampleCustomSettingManager {
    
  /*  private static SampleCustomSetting__c privateSettings = null;
    public static SampleCustomSetting__c get() {
        if (privateSettings == null) {
            if (Test.isRunningTest()) {
                privateSettings = (SampleCustomSetting__c)SampleCustomSetting__c.SObjectType.newSObject(null, true);
            } else {
                privateSettings = SampleCustomSetting__c.getOrgDefaults();
            }
        }
        return privateSettings;
    }

    public static void set(SampleCustomSetting__c newSettings) {
        if (Test.isRunningTest()) {
            privateSettings = newSettings;
        } else {
            upsert newSettings;
            privateSettings = SampleCustomSetting__c.getOrgDefaults();
        } */
    }