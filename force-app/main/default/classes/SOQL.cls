/**
* The SOQL class serves as a primer into the Salesforce Object Query Language in Apex.
* It covers fundamental aspects such as SELECT statements, WHERE clauses, Relationship queries, and LIMIT keyword.
*
* This class introduces developers to the concept of retrieving data from Salesforce using SOQL. It provides
* a step-by-step guide on how to construct SOQL queries, filter results using WHERE clause, retrieve related
* records, and manage data volume using the LIMIT keyword.
* 
* Topics covered in this class include:
* - Understanding the structure of a SOQL query.
* - Crafting basic SELECT statements in SOQL.
* - Applying filters using the WHERE clause in SOQL.
* - Fetching related records using Relationship queries.
* - Controlling the amount of data retrieved using the LIMIT keyword.
* 
* Users of this class can expect to gain a solid understanding of SOQL in Apex and
* be prepared to handle data retrieval tasks in Salesforce development.
* 
* @author Your Name
*/

public with sharing class SOQL {
    
    /**
     * Question 1
     * Update/Uncomment the template code to create a method
     * Returns all leads from Salesforce Org
     * @return List of all leads with Id, LastName, Company, Phone, Email
     * Update the corresponding test class and testGetAllLeads method to cover this method
     */
    // [public | private ] [static] data_type method_name (input parameters) {
    //  The body of the method

    public static List<Lead> getLead() {
        // Query and return all Leads with the specified fields
        return [SELECT Id, LastName, Company, Phone, Email FROM Lead];
    }
    //}

    /**
     * Question 2
     * Update/Uncomment the template code to create a method
     * Returns all contacts with first name of John.
     * @return A list of Contact records.
     * Update the corresponding test class and testGetContactsByFirstName method to cover this method
     */
    //[public | private ] [static] data_type method_name (input parameters) {
    //  The body of the method
    //}
    public static List<Contact> johnContact() {
        // Query and return all Contacts where the first name is 'John'
        return [SELECT Id, Name FROM Contact WHERE FirstName = 'John'];
    }


    /**
     * Question 3
     * Update/Uncomment the template code to create a method
     * Returns the Contact Id for all contacts with last name of Smith or Jones
     * @return A list of Contact Ids.
     * Update the corresponding test class and testGetContactIdsByLastName method to cover this method
     */
    //[public | private ] [static] data_type method_name (input parameters) {
    //  The body of the method
    //}

    public static List<Id> smithjonesContact() {

        // Query for Contacts where the last name is 'Smith' or 'Jones'
        List<Contact> contactIds = [SELECT Id FROM Contact WHERE LastName = 'Smith' OR LastName = 'Jones'];
    
        // Initialize a list to store the Ids of the retrieved Contacts
        List<Id> Ids = new List<Id>();
    
        // Loop through the Contacts and add their Ids to the list
        for (Contact c : contactIds) {
            Ids.add(c.Id);
        }
    
        // Return the list of Ids
        return Ids;
    }
    

    /**
     * Question 4
     * Update/Uncomment the template code to create a method
     * Returns List of closed won opportunities for a specific Account.
     * Example: yourMethodName('001XXXXXXXXXXXX') should return the list of closed won opportunities for the Account with the Id
     * @param accountId The ID of the Account.
     * @return A list of Opportunities with important opportunities fields
     * Update the corresponding test class and testGetClosedWonOpportunityCountByAccount method to cover this method
     */
    //[public | private ] [static] data_type method_name (input parameters) {
    //  The body of the method
    //}

    public static List<Opportunity> getClosedOpportunity(String accId) {

        // Query and return all Opportunities related to the given Account ID 
        // where the StageName is 'Closed Won'
        return [SELECT Id, Name, CloseDate, Amount, StageName, AccountId 
                FROM Opportunity 
                WHERE AccountId = :accId AND StageName = 'Closed Won'];
    }
    /**
     * Question 5
     * Update/Uncomment the template code to create a method
     * Returns the total count of Account records.
     * @return The Integer count of Account records.
     * Update the corresponding test class and testGetAccountCount method to cover this method
     */
    //[public | private ] [static] data_type method_name (input parameters) {
    //  The body of the method
    //}

    public static Integer countAccount() {
        // Query to count the total number of Account records
        List<AggregateResult> cAccount = [SELECT COUNT(Id) total FROM Account];
        
        // Extract the count from the query result
        Integer totalAccount = (Integer) cAccount[0].get('total');
        
        // Return the total count of Account records
        return totalAccount;
    }

    /**
     * Question 6
     * Update/Uncomment the template code to create a method
     * Return Key Value pair of Task Id and Task records for any tasks due date within the next 7 days.
     * @return A map of Task Ids to Task records.
     * Update the corresponding test class and testGetTasksDueNextWeek method to cover this method
     */
    //[public | private ] [static] data_type method_name (input parameters) {
    //  The body of the method
    //}

    public static Map<Id, Task> taskIdMap() {
        // Query to retrieve Tasks with their Id, Subject, and ActivityDate 
        // where the ActivityDate is within the next 7 days
        Map<Id, Task> taskMap = new Map<Id, Task>([SELECT Id, Subject, ActivityDate 
                                                   FROM Task 
                                                   WHERE ActivityDate = NEXT_N_DAYS:7]);
    
        // Return the map where the key is the Task Id and the value is the Task record
        return taskMap;
    }
    


    /**
     * Question 7
     * Update/Uncomment the template code to create a method
     * Retrieves all Contacts that have a example.com domain in their Email.
     * @return A list of Contact records.
     * Update the corresponding test class and testGetContactsByEmailDomain method to cover this method
     */
    //[public | private ] [static] data_type method_name (input parameters) {
    //  The body of the method
    //}

    public static List<Contact> getContactByEmail() {
        // Query to retrieve Contacts with their FirstName, Name, LastName, and Email
        // where the Email address ends with '@example.com'
        return [SELECT FirstName, Name, LastName, Email 
                FROM Contact 
                WHERE Email LIKE '%@example.com'];
    }
    

    

    /**
     * Question 8
     * Retrieves all Opportunities that have a specific keyword in their Name.
     * Example: getOpportunitiesByNameKeyword('keyword') should return all Opportunities that have 'keyword' in their Name.
     * @param keyword The keyword to search for in the Opportunity Name.
     * @return A list of Opportunity records.
     */
    public static List<Opportunity> getOpportunitiesByNameKeyword(String keyword) {

        // Prepare the search keyword with wildcards for partial matching
        String searchKeyword = '%' + keyword + '%';
        
        // Query to retrieve Opportunities where the Name contains the search keyword
        List<Opportunity> opp = [SELECT Name, StageName, CloseDate, AccountId 
                                 FROM Opportunity 
                                 WHERE Name LIKE :searchKeyword];
                                 
        // Return the list of Opportunities that match the search criteria
        return opp;
    }
    
    /**
     * Question 9
     * Retrieves all Cases that Case Origin is not Web or Email or Blank
     * @return A list of Case records.
     */
    public static List<Case> getFilterCaseOrigins() {
        // Query to retrieve Cases where the Origin is not 'Web', 'Email', or an empty string
        return [SELECT Status, AccountId, Origin 
                FROM Case 
                WHERE Origin NOT IN ('Web', 'Email', '')];
    }
    
    

    /**
     * Question 10
     * Update/Uncomment the template code to create a method
     * Retrieves all Leads that have a specific Lead Source or contain a specific keyword in their Title.
     * Example: yourMethodName('Web', 'Engineer') should return all Leads that have 'Web' in their Lead Source or 'Engineer' in their Title.
     * @param leadSource The Lead Source to search for.
     * @param keyword The keyword to search for in the Lead Title.
     * @return A list of Lead records.
     * Update the corresponding test class and testGetLeadsBySourceOrTitle method to cover this method
     */
    //[public | private ] [static] data_type method_name (input parameters) {
    //  The body of the method
    //}    

    public static List<Lead> filterLead(String leadSource, String keyword) {
        // Prepare the search keyword with wildcards for partial matching
        String keyForLeadSource = '%' + leadSource + '%';
        String keyForKeyword = '%' + keyword + '%';
        
        // Query to retrieve Leads where LeadSource or Title matches the provided criteria
        return [SELECT LastName, Company, Phone, Email, LeadSource, Title 
                FROM Lead
                WHERE LeadSource LIKE :keyForLeadSource 
                OR 
                Title LIKE :keyForKeyword];
    }
    

    /**
     * Question 11
     * Returns the names of all Contacts associated with an Account.
     * Example: getContactNamesByAccount('001XXXXXXXXXXXX') should return the list of Contact LastNames for the Account with the Id
     * @param accountId The ID of the Account.
     * @return A list of Contact LastName.
     */
    public static List<String> getContactNamesByAccount(Id accountId) {

        // Create a list to hold the Contact LastNames
        List<String> contactLastName = new List<String>();
    
        // Query Contacts associated with the given AccountId
        List<Contact> getContact = [SELECT LastName FROM Contact WHERE AccountId = :accountId];
    
        // Loop through each Contact and add the LastName to the list
        for (Contact c : getContact) {
            contactLastName.add(c.LastName);
        }
    
        // Return the list of Contact LastNames
        return contactLastName;
    }
    

    /**
     * Question 12
     * Returns the total revenue for all Opportunities in a specific Stage or if the amount is greater than 10000.
     * Example: getTotalRevenueByStage('Closed Won') should return the total revenue for all Opportunities in the 'Closed Won' Stage.
     * @param stage The Stage value to filter Opportunities.
     * @return The total revenue.
     */
    public static Decimal getTotalRevenueByStage(String stage) {
        // Query to calculate the total revenue for opportunities with the specified stage
        List<AggregateResult> totalOpportunity = [
            SELECT Sum(Amount) total 
            FROM Opportunity 
            WHERE StageName = :stage OR Amount > 10000
        ];
    
        // Return the total revenue from the query result
        return (Decimal)totalOpportunity[0].get('total');
    }
    

    /**
     * Question 13
     * Retrieves the first 10 Accounts ordered by Name.
     * @return A list of the first 10 Accounts ordered by Name.
     */
    public static List<Account> getFirstTenAccounts() {
        // Query to retrieve the first ten accounts ordered by name
        return [SELECT Name, Id 
                FROM Account 
                ORDER BY Name 
                LIMIT 10];
    }
    
    /**
     * Question 14
     * Retrieves the Opportunities with an Amount greater than 100,000, ordered by CloseDate, and limited to 5 records.
     * @return A list of Opportunities with an Amount greater than 100,000, ordered by CloseDate, and limited to 5 records.
     */
    public static List<Opportunity> getHighValueOpportunities() {
        // Query to retrieve the top 5 high-value opportunities with amount greater than 100,000, ordered by close date
        return [SELECT Name, AccountId, CloseDate, StageName, Amount
                FROM Opportunity
                WHERE Amount > 100000
                ORDER BY CloseDate
                LIMIT 5];
    }

    /**
     * Question 15
     * Retrieves the Contacts with the most recent Birthdate, ordered by Birthdate, and limited to 3 records.
     * @return A list of Contacts
     */
    public static List<Contact> getBirthdateContacts() {
    // Query to retrieve the 3 most recent contacts based on birthdate, ordered from latest to earliest
    return [SELECT LastName, Birthdate
            FROM Contact
            ORDER BY Birthdate DESC
            LIMIT 3];
    }

    
    /**
     * Question 16
     * Retrieves the Cases in the Open Status, ordered by CreatedDate, and limited to 10 records with an offset of 5.
     * @return A list of Cases
     */
    public static List<Case> getCasesWithStatus() {
        // Query to retrieve 10 open cases, skipping the first 5, ordered by creation date
        return [SELECT Subject, Status, CreatedDate
                FROM Case
                WHERE Status = 'Open'
                ORDER BY CreatedDate
                LIMIT 10
                OFFSET 5];
    }

    /**
     * Question 17
     * Returns Set of Case Ids for a specific Account.
     * Example: getCaseIdsByAccount('001XXXXXXXXXXXX') should return the set of Case Ids for the Account with the Id
     * @param accountId The ID of the Account.
     * @return A set of Case Ids.
     */
    public static Set<Id> getCaseIdsByAccount(Id accountId) {
        // Create a set to hold the Case Ids
        Set<Id> caseIds = new Set<Id>();
    
        // Query to retrieve Case Ids associated with the given Account Id
        List<Case> caseList = [SELECT Id FROM Case WHERE AccountId = :accountId];
    
        // Add each Case Id to the set
        for (Case c : caseList) {
            caseIds.add(c.Id);
        }
    
        return caseIds;
    }

    /**
     * Question 18
     * Return Map of Account Ids to Account Names Not in a specific Country.
     * Example: getAccountIdsToNamesNotInCountry('United States') should return the map of Account Ids to Account Names for Accounts that are not in the United States.
     * @param country The country to filter Accounts.
     * @return A map of Account Ids to Account Names.
     */
    public static Map<Id, String> getAccountIdsToNamesNotInCountry(String country) {
        // Create a map to hold Account Ids and their corresponding names
        Map<Id, String> accountIdsToNames = new Map<Id, String>();
    
        // Query to retrieve Accounts not in the specified country
        List<Account> accountList = [SELECT Id, Name, BillingCountry
                                    FROM Account
                                    WHERE BillingCountry != :country];
    
        // Add each Account Id and Name to the map
        for (Account a : accountList) {
            accountIdsToNames.put(a.Id, a.Name);
        }
    
        return accountIdsToNames;
    }
    

    /**
     * Question 19
     * Retrieves the Account Name for a given Contact.
     * Example: getAccountNameForContact('003XXXXXXXXXXXX') should return the Account Name for the Contact with the Id
     * @param contactId The Id of the Contact.
     * @return The Account Name of the Contact.
     */
    public static String getAccountNameForContact(String contactId) {
        // Query to retrieve the Account Name associated with the given Contact Id
        List<Contact> contactList = [SELECT Account.Name 
                                     FROM Contact
                                     WHERE Id = :contactId];
    
        // Return the Account Name from the query result
        return contactList[0].Account.Name;
    }
        

    /**
     * Question 20
     * Returns single Account that has related opportunities in the same query
     * Example: getAccountAndOpportunitiesFromAccountId('001XXXXXXXXXXXX') should return the Account Name for the Account with the Id and all related Opportunities
     * @param accountId The ID of the Account.
     * @return An Account record with related Opportunities.
     */
    public static Account getAccountAndOpportunitiesFromAccountId(Id accountId) {
        // Query to retrieve the Account and its related Opportunities by Account Id
        return [SELECT Name, Id,
                (SELECT Id, Name, StageName, CloseDate
                 FROM Opportunities)
                FROM Account
                WHERE Id = :accountId];
    }
    

    /**
     * Question 21
     * Retrieves all contacts that have the Mailing State similar to the Account Billing State.
     * Example: getAccountsWithContactsByState('001XXXXXXXXXXXX') should return a list of Contacts that have the same Mailing State as the Account with the Id
     * @param Account Id
     * @return List of contacts with the same Mailing State as the Account Billing State
     */
    public static List<Contact> getAccountsWithContactsByState(Id accountId) {
        // Query to retrieve the BillingState of the Account with the given Id
        List<Account> accountBillingState = [SELECT BillingState FROM Account WHERE Id = :accountId];
        
        // Store the Account's BillingState
        String billingState = accountBillingState[0].BillingState;
        
        // Query to retrieve Contacts whose MailingState matches the Account's BillingState
        return [SELECT LastName, AccountId, MailingState
                FROM Contact
                WHERE MailingState = :billingState];
    }
    

    /**
     * Question 22
     * Extracts email domains from them leads, then finds Accounts with matching website domains
     * If Lead Email = test@test.com return account with website = www.test.com
     * Example: findAccountsByLeadEmailDomains([set of lead ids]) should return a list of Accounts with matching email domains
     * @param A set of Lead Ids.
     * @return A list of Accounts with matching email domains.
     */
    public static List<Account> findAccountsByLeadEmailDomains(Set<Id> leadIds) {
        // Query to retrieve Leads with the specified Ids
        List<Lead> leads = [SELECT Id, Name, Email FROM Lead WHERE Id IN :leadIds];
    
        // Create a set to hold email domains extracted from Leads
        Set<String> domainNames = new Set<String>();
    
        // Loop through each Lead
        for (Lead l : leads) {
            // Check if the email is not null
            if (l.Email != null) {
                // Extract the domain from the email and format it
                List<String> split = l.Email.split('@');
                String domain = 'www.' + split[1];
                domainNames.add(domain);
            }
        }
        
        // Query to retrieve Accounts where the Website matches any of the extracted domains
        return [SELECT Id, Name, Website FROM Account WHERE Website IN :domainNames];
    }
    

    /**
     * Question 23
     * Clones and Inserts Opportunity Line Items from an original Opportunity to a list of cloned Opportunities.
     * Adds a randomized number between 1 to 3 to the quantity of each line item.
     * Example: cloneLineItems('001XXXXXXXXXXXX', [list of opportunity ids]) should clone the line items from the Opportunity with the Id to each Opportunity in the list
     * @param Original Opportunity Id
     * @param List of cloned Opportunity Ids
     */
    public static void cloneLineItems(Id origOppId, List<Id> cloneOppIds) {
       // Query to retrieve Opportunity Line Items from the original Opportunity
        List<OpportunityLineItem> oppLineItem = [SELECT Id, Quantity, UnitPrice, Product2Id, TotalPrice, OpportunityId, Opportunity.Pricebook2Id
                                                FROM OpportunityLineItem
                                                WHERE OpportunityId = :origOppId];

        // Lists to hold the new Opportunity Line Items and Opportunities
        List<OpportunityLineItem> dupOppLineItems = new List<OpportunityLineItem>();
        List<Opportunity> oppList = new List<Opportunity>();

        // Generate a random number between 1 and 3 for Quantity
        Integer randomNumber = (Integer)(Math.random() * 3) + 1;

        // Iterate over each Opportunity Id in the cloneOppIds list
        for(Id id: cloneOppIds){ 
            // Iterate over each original Opportunity Line Item
            for(OpportunityLineItem dupOppLL: oppLineItem){
                // Create a new Opportunity and set its Pricebook2Id
                Opportunity newOpp = new Opportunity();
                newOpp.Id = id;
                newOpp.Pricebook2Id = dupOppLL.Opportunity.Pricebook2Id;
                oppList.add(newOpp);

                // Create a new Opportunity Line Item and copy relevant details
                OpportunityLineItem oli = new OpportunityLineItem();
                oli.Quantity = randomNumber;
                oli.UnitPrice = dupOppLL.UnitPrice;
                oli.Product2Id = dupOppLL.Product2Id;
                oli.OpportunityId = id;
                dupOppLineItems.add(oli);
            }

        }
        // Upsert new Opportunities
        upsert oppList;

        // Insert new Opportunity Line Items
        insert dupOppLineItems;
    }
    
    
    /**
     * Question 24
     * Retrieves the Opportunity Name, Account Name, and Owner Name for Opportunities that have a Stage of 'Closed Won'.
     * Example: getOpportunityDetailsForClosedWon()
     * @return A list of filtered Opportunity
     */
    public static List<Opportunity> getOpportunityDetailsForClosedWon() {
        // Query to retrieve Opportunities with a stage of 'Closed Won'
        List<Opportunity> filteredOpp = [SELECT Name, Account.Name, Account.Id, Owner.Name
                                          FROM Opportunity
                                          WHERE StageName = 'Closed Won'];
        
        // Return the list of Opportunities
        return filteredOpp;
    }
    

    /**
     * Question 25
     * Sets the 'Primary_Contact__c' field for all Closed Won Opportunities to first Contact on the Account.
     * Example: setPrimaryContact() should set the 'Primary_Contact__c' field for every Opportunity in the org
     */
    public static void setPrimaryContact() {
        // Retrieve Opportunities with the stage 'Closed Won'
        List<Opportunity> oppList = getOpportunityDetailsForClosedWon();
    
        // Create a set of Account Ids from the Opportunities
        Set<Id> accountIds = new Set<Id>();
        for (Opportunity opp : oppList) {
            accountIds.add(opp.Account.Id);
        }
    
        // Query Contacts associated with the Accounts
        List<Contact> contactList = [SELECT Id, FirstName, LastName, AccountId, CreatedDate
                                     FROM Contact
                                     WHERE AccountId IN :accountIds];
    
        // Create a map to associate Account Ids with Contacts
        Map<Id, Contact> accountIdsContactMap = new Map<Id, Contact>();
        for (Contact c : contactList) {
            // Add Contact to the map for the associated Account Id
            accountIdsContactMap.put(c.AccountId, c);
        }
    
        // Loop through each Opportunity and set the Primary Contact
        for (Opportunity opp : oppList) {
            Contact primaryContact = accountIdsContactMap.get(opp.Account.Id);
            if (primaryContact != null) {
                opp.Primary_Contact__c = primaryContact.Id;
            }
        }
    
        // Update the Opportunities with the new Primary Contact
        update oppList;
    }
    
}