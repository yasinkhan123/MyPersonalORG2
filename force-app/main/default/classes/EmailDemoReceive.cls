global class EmailDemoReceive implements Messaging.InboundEmailHandler 
{
  global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.Inboundenvelope envelope) {
      system.debug('inside email handler :'+email);
      return null;
  }
}