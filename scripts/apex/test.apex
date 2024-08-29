List<Contact> contactList = [SELECT Id, AccountId, CreatedDate, FirstName, LastName FROM Contact WHERE AccountId = '001aj00000RYWnWAAX' ORDER BY CreatedDate ASC];

System.debug(contactList[0].AccountId);



// Integer randomNumber = (Integer)(Math.random() * 3) + 1;

// System.debug(randomNumber);

// * Question 24
// * Retrieves the Opportunity Name, Account Name, and Owner Name for Opportunities that have a Stage of 'Closed Won'.
// * Example: getOpportunityDetailsForClosedWon()
// * @return A list of filtered Opportunity
// */
// public static List<Opportunity> getOpportunityDetailsForClosedWon() {        
//    return null; // Replace null with the variable you used to store the result
// }

// List<Opportunity> filteredOpp = [SELECT Name, Account.Name, Owner.Name FROM Opportunity WHERE StageName = 'Closed Won'];
// System.debug(filteredOpp);
// List<Account> account = [Select Id FROM Account LIMIT 5];
// List<Id> accountIds = new List<Id>();

// for(Account a : account){
//     accountIds.add(a.Id);
// }

// System.debug(accountIds);






// for(Contact c: contactList){
//     System.debug(c.AccountId);
//     System.debug(c);
// }