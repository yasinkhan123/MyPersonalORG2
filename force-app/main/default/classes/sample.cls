public class sample {

    public String Accounts { get; set; }
public Boolean showAccounts {get; set;}

   public sample ()
{
  showAccounts = true;
}

public void ShowAccounts()
{
  showAccounts = true;
}

public void ShowCustom()
{
  showAccounts = false;
}

}