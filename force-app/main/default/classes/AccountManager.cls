@RestResource(urlMapping='/Account/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Account/', '/contacts');        
        Account result = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id=:accountId];
        system.debug('result: '+result);        
        return result;
    }
}
//  @RestResource(urlMapping='/Account/*/contacts')
//Global with sharing class AccountManager {
//@HttpGet
/*    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String AccountId = request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1);
        Account result =  [select id ,name ,(select id ,Name from contacts) from Account 
                        WHERE Id = :AccountId];
        return result;
    }
}*/