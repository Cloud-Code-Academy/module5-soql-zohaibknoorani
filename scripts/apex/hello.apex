// // * Update/Uncomment the template code to create a method
// //      * Return Key Value pair of Task Id and Task records for any tasks due date within the next 7 days.
// //      * @return A map of Task Ids to Task records.

// // Map<Id, Task> taskMap = new Map<Id, Task>([SELECT Id, Subject, ActivityDate FROM Task WHERE ActivityDate < LAST_N_DAYS:7]);

// // List<Task> taskList = [SELECT Id, Subject, ActivityDate FROM Task];

// // System.debug(taskMap);

// String keyword = 'Emergency';
// String searchPattern = '%' + keyword + '%';

// List<Opportunity> opp = [SELECT Name, StageName, CloseDate, AccountId 
//                          FROM Opportunity 
//                          WHERE Name LIKE :searchPattern];

// System.debug(opp);

// String email = 'zeb@gmail.com';
// List<String> split = email.split('@');
// String newEmail = 'www.' + split[1];
// System.debug(newEmail);

// * Question 23
//      * Clones and Inserts Opportunity Line Items from an original Opportunity to a list of cloned Opportunities.
//      * Adds a randomized number between 1 to 3 to the quantity of each line item.
//      * Example: cloneLineItems('001XXXXXXXXXXXX', [list of opportunity ids]) should clone the line items from the Opportunity with the Id to each Opportunity in the list
//      * @param Original Opportunity Id
//      * @param List of cloned Opportunity Ids


// Step 1: 
// Get all the opportunity line item from origional opportunity

// Step 2: 
// For Opportunity Ids:
//     For Opportunity Line Item:
//         Create a dulplicate Opportunity Line Item


        public static void cloneLineItems(Id origOppId, List<Id> cloneOppIds) {
            // Query the original Opportunity Line Items
    
            List<OpportunityLineItem> oppLineItem = [SELECT Id, Quantity, UnitPrice, Product2Id, TotalPrice, OpportunityId
                                                    FROM OpportunityLineItem
                                                    WHERE OpportunityId = :origOppId];
    
            // Create a list to hold the new line items
            
    
            // Generate a random number between 1 and 3
    
            // Loop through each cloned Opportunity Id
    
                // Loop through each original line item
    
                    // Clone the original line item and add the random number to the quantity
    
            // Insert the new line items
        }


// /**
//      * Question 25
//      * Sets the 'Primary_Contact__c' field for all Closed Won Opportunities to first Contact on the Account.
//      * Example: setPrimaryContact() should set the 'Primary_Contact__c' field for every Opportunity in the org
//      */
    public static void setPrimaryContact() {
        // Use the getOpportunityDetailsForClosedWon() method to get the Opportunities

        // Create a set of Account Ids from the Opportunities

        // Query the Contacts

        // Loop through each Contact and add the Account Id and Contact to the map
        
        // Loop through each Opportunity

        //         Update the Opportunity primary contact from accountToContactMap

        // Update the Opportunities
    }

        