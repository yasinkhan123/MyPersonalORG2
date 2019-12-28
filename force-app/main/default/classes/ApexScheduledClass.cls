global class ApexScheduledClass Implements Schedulable
            {
                       global void execute(SchedulableContext sc)
                        {
                                    sendmail();
                        }
                        public void sendmail()
                        {
                                    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                                    string [] toaddress= New string[]{'yasin.khan@aqxolt.com'};
                                    email.setSubject('Testing Apex Scheduler-Subject');
                                    email.setPlainTextBody('Testing Apex Scheduler-Body');
                                    email.setToAddresses(toaddress);
                                    Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
                        }
            }