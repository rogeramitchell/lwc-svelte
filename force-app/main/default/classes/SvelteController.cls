public class SvelteController
{
  @AuraEnabled
  public static List<Contact> getContacts() 
  {
    return [SELECT Id, Name, Title FROM Contact ORDER BY Name];
  }
}
