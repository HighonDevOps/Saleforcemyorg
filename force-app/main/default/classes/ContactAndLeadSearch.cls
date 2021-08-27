public class ContactAndLeadSearch{
    public static List<List<Sobject>> searchContactsAndLeads(string Smith){

     List<List<Sobject>> contactsandleadsrecords =[find 'Smith' in all fields RETURNING contact(firstname,lastname),lead(firstname,lastname)];
     return contactsandleadsrecords ;
    }
}