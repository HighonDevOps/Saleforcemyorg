public class AccountHandler {
 public Static Account insertNewAccount(String AccountName)
    {
        Account acc=new Account(name=AccountName);
        try{
            insert acc;
        }
        catch(DMLException e){
            return null;
        }
        return acc;
    }
}