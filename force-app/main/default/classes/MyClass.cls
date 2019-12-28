public class MyClass {
    public void add(){
        system.debug('inside add method');
    }
    public string name(){
        system.debug('inside name method');
        return 'my name is';
    }
    public static string sub(){
        system.debug('inside sub method');
        return 'hurmat zaiba';
    }
    public MyClass(){
        system.debug('inside constructor');
    }
    public MyClass(integer a, integer b){
                system.debug('inside constructor with variables- overloading of constructor'+' '+(a+b));
    }
    public void add(integer a, integer b){
        system.debug('overload method'+ ' '+ (a*b));
            
    }
}