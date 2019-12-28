public class MultipleAttachWithTransient {

    public  Attachment  tAttachment     {get;set;}
    public  Attachment  tAttachment1    {get;set;}
    public  Attachment  tAttachment2    {get;set;}
    public  Attachment  tAttachment3    {get;set;}
    public  Attachment  tAttachment4    {get;set;}
    public  Attachment  tAttachment5    {get;set;}
    
    public List<Attachment> tAttachmentList  {get;set;}
    public MultipleAttachWithTransient(){
        tAttachmentList = new List<Attachment>();
        this.tAttachment = new Attachment();
        this.tAttachment1 = new Attachment();
        this.tAttachment2 = new Attachment();
        this.tAttachment3 = new Attachment();
        this.tAttachment4 = new Attachment();
        this.tAttachment5 = new Attachment();
        
    }

    public void doUploadFile(){

       
        tAttachment.ParentId = 'a00i000000UIuKP';
        tAttachment.Name = 'Cap';        
         Database.Insert(tAttachment);
        
        
       
      
      
        tAttachmentList.add(tAttachment);
        tAttachmentList.add(tAttachment1);
        tAttachmentList.add(tAttachment2);
        tAttachmentList.add(tAttachment3);
        tAttachmentList.add(tAttachment4);
        tAttachmentList.add(tAttachment5);
       // upsert tAttachmentList;
      } 

}