@RestResource(urlMapping ='/FieldCase/*')
global with sharing class RestCaseController {
    
    
    @HttpGet
    
    global static List<Case> getOpenCases()
    {
        String CompanyName=RestContext.request.params.get('CompanyName');
        Account company =[ Select Id,name from Account where name = : CompanyName];
        List <Case> cases = [Select id,OwnerId,CaseNumber,Origin,Status from case where AccountId = :company.Id ];
        return cases;
    }
    @HttpDelete
    
    global static String deleteClosedCases()
    {
    String CompanyName=RestContext.request.params.get('CompanyName');
        Account company =[ Select Id,name from Account where name = : CompanyName];
        List <Case> cases = [Select id,OwnerId,CaseNumber,Origin,Status from case where AccountId = :company.Id and Status='Closed'];
        delete cases;
        return 'Closed Cases Deleted';
    }
    @HttpPost
     global static String createNewAccount(String acctName , String descr)
    {
   Account a = new Account ();
   a.Name =acctName;
   a.Description=descr;
   insert a;
   return 'Done';
   }
    

}