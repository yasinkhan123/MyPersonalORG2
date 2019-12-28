public class displayImageExtension {

public Attachment file {get;set;}
public Attachment file1 {get;set;}
public Attachment file2 {get;set;}
public Attachment file3 {get;set;}
public Attachment file4 {get;set;}
public Attachment file5 {get;set;}
public String opt      {get;set;}
 
public displayImageExtension(){
file1 = new Attachment();
file2 = new Attachment();
file3 = new Attachment();
file4 = new Attachment();
file5 = new Attachment();
opt = 'none';
//file=[Select Id,Name,LastModifiedDate from attachment where id =: '00Pi000000GdAtc'];
//file=[Select Id,Name,body, LastModifiedDate from attachment limit 1];
}

public void saveImageExtension(){
  
  file1.name= 'bike';
  file1.parentId = 'a00i000000UIuKP';
  upsert file1;
   file1.body = null; 
 
  file2.name= 'bike';
  file2.parentId = 'a00i000000UIuKP';
  upsert file2;
   file2.body = null;
   
    file3.name= 'bike';
  file3.parentId = 'a00i000000UIuKP';
  upsert file3;
   file3.body = null;
    
    file4.name= 'bike';
  file4.parentId = 'a00i000000UIuKP';
  upsert file4;
   file4.body = null; 
    
    file5.name= 'bike';
  file5.parentId = 'a00i000000UIuKP';
  upsert file5;
   file5.body = null; 
    opt = 'd';
    
//file=[Select Id,Name,LastModifiedDate,body from attachment order by createddate desc limit 1];
}


}