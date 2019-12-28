public class selectMultipleAttachment {

    public void getSelectMultipleAttachmentMethod() {
        
    }


   public Attachment att {get;set;}
   public string s1 {get;set;} 
   public selectMultipleAttachment(){
            s1= '00Pi000000G7QXT';
           
            att = [SELECT id,parentId,body,name FROM Attachment WHERE id =: s1 limit 1 ];
            
   }
   
   public pagereference selectMultipleAttachmentMethod(){
   

      PageReference page = new PageReference('MultipleFilesUploadPage');
        page.setredirect(true);
        return page;
   }
}