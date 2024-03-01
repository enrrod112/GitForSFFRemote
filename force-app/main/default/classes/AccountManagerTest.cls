@isTest
public class AccountManagerTest {

    @isTest(SeeAllData=true)
    public static void testGetAccount(){
        
        Account a = [SELECT Id FROM Account LIMIT 1];
        // Set up a test request
        RestRequest request = new RestRequest();
        // Set request properties
        request.requestUri = 'https://cunning-fox-unspoh-dev-ed.my.salesforce.com/services/apexrest/Account/'+a.Id+'/contacts';
        request.httpMethod = 'GET';
        // Finally, assign the request to RestContext if used
        RestContext.request = request;

        Account result = AccountManager.getAccount();
        system.assertEquals(a.Id, result.Id);
    }
    
}
//@isTest
/*Private class AccountManagerTest {
 @isTest static void testGetAccountById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.my.salesforce.com/services/apexrest/Account/'+recordId+'/contacts'
            + recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Paladium', thisAccount.Name);
    }
     // Helper method
    static Id createTestRecord() {
        // Create test record
        Account AccountTest = new Account(
            RecordTypeId='0125f0000003oUhAAI',
            Name='Paladium');
        insert AccountTest;
        Contact ContactTest = new Contact(
        	AccountId =AccountTest.Id,
        	FirstName ='Luis Eduardo',
        	LastName = 'Galvis');
        insert ContactTest;
        return AccountTest.Id;
    }          
}*/