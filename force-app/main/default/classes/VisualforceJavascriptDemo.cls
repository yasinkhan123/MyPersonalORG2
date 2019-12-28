public class VisualforceJavascriptDemo{

    public string myparam {get; set;}

    public VisualforceJavascriptDemo(){
     system.debug('-- value');
        myparam = 'Initial value';
        system.debug('-- value'+myparam);
    }

    public PageReference myJSAction(){
        return null;
    }
}