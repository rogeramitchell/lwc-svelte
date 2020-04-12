@isTest
public class SvelteControllerTest 
{
  private static final Integer NUMBER_TO_CREATE = 10;

  @testSetup 
  static void testSetup() 
  {
    Account testAccount = new Account();
    testAccount.Name = 'Svelte Pizzeria';
    insert testAccount;

    List<Contact> testContacts = new List<Contact>();

    for(Integer i = 0; i < NUMBER_TO_CREATE; i += 1) 
    {
      Contact testContact = new Contact();
      testContact.FirstName = 'Test ' + i;
      testContact.LastName = 'Test ' + i;
      testContact.AccountId = testAccount.Id;
      testContacts.add(testContact);
    }

    insert testContacts;
  }

  @isTest 
  static void testGetContacts() 
  {
    List<Contact> contacts = SvelteController.getContacts();
    System.assertEquals(NUMBER_TO_CREATE, contacts.size());
  }

  @isTest 
  static void testUpdateContactToPizza() 
  {
    Contact pizza = [SELECT Id, FirstName, LastName FROM Contact LIMIT 1];
    System.assertNotEquals('🍕', pizza.FirstName);
    System.assertNotEquals('🍕', pizza.LastName);

    SvelteController.updateContactToPizza(pizza.Id);
    pizza = [SELECT Id, FirstName, LastName FROM Contact LIMIT 1];
    System.assertEquals('🍕', pizza.FirstName);
    System.assertEquals('🍕', pizza.LastName);
  }
}
