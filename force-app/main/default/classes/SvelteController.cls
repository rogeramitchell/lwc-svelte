public class SvelteController
{
  @AuraEnabled
  public static List<Contact> getContacts() 
  {
    return [SELECT Id, Name, Title FROM Contact ORDER BY Name];
  }

  @AuraEnabled 
  public static void updateContactToPizza(Id contactId)
  {
    Contact pizzaName = [SELECT Id FROM Contact WHERE Id = :contactId];
    pizzaName.FirstName = '🍕';
    pizzaName.LastName = '🍕';
    update pizzaName;
  }
}
