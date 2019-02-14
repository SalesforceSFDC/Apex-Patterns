/** 
* To include SOQL queries within your Apex code, wrap the SOQL statement within square brackets and assign
* the return value to an array of sObjects. 
*/
Account[] accts = [SELECT Name, Phone FROM Account];

//Add an account and related contact
Account acct = new Account(
    Name = 'Crowdart',
    Phone = '415-635-9877',
    NumberOfEmployees = 50,
    BillingCity = 'San Francisco'
);

insert acct;

//Once the account is inserted, the sObject will be populated with an Id.
//Get this Id.
ID acctID = acct.ID;

Contact con = new Contact(
    FirstName='Carol',
    LastName='Ruiz',
    Phone='(415)555-1212',
    Department='Wingo',
    AccountId=acctID);
insert con;
// Add account with no contact
Account acct2 = new Account(
    Name='The SFDC Query Man',
    Phone='(310)555-1213',
    NumberOfEmployees=50,
    BillingCity='Los Angeles',
    Description='Expert in wing technologies.');
insert acct2;

Account[] accts = [SELECT Name,Phone FROM Account];
SELECT Name,Phone FROM Account
SELECT fields FROM ObjectName [WHERE Condition]
SELECT Name,Phone FROM Account
SELECT Name,Phone FROM Account WHERE Name='SFDC Computing'
SELECT Name,Phone FROM Account WHERE (Name='SFDC Computing' AND NumberOfEmployees>25)
SELECT Name,Phone FROM Account WHERE (Name='SFDC Computing' OR (NumberOfEmployees>25 AND BillingCity='Los Angeles'))
WHERE Name LIKE 'SFDC%'
SELECT Name,Phone FROM Account ORDER BY Name
SELECT Name,Phone FROM Account ORDER BY Name ASC
SELECT Name,Phone FROM Account ORDER BY Name DESC
Account oneAccountOnly = [SELECT Name,Phone FROM Account LIMIT 1];
SELECT Name,Phone FROM Account 
                   WHERE (Name = 'SFDC Computing' AND NumberOfEmployees>25)
                   ORDER BY Name
                   LIMIT 10

Account[] accts = [SELECT Name,Phone FROM Account 
                   WHERE (Name='SFDC Computing' AND NumberOfEmployees>25)
                   ORDER BY Name
                   LIMIT 10];
System.debug(accts.size() + ' account(s) returned.');
// Write all account array info
System.debug(accts);

// Accessing Variables in SOQL Queries:
// SOQL statements in Apex can reference Apex code variables and expressions if they are preceded by a colon (:)
// The use of a local variable within a SOQL statement is called a bind.
String targetDepartment = 'Wingo';
Contact[] techContacts = [SELECT FirstName,LastName 
                          FROM Contact WHERE Department=:targetDepartment];

// To get child records related to a parent record, add an inner query for the child records.
// The FROM clause of the inner query runs against the relationship name, rather than a Salesforce object name. 
Account[] acctsWithContacts = [SELECT Name, (SELECT FirstName,LastName FROM Contacts)
                               FROM Account 
                               WHERE Name = 'SFDC Computing'];
// Get child records
Contact[] cts = acctsWithContacts[0].Contacts;
System.debug('Name of first associated contact: ' 
             + cts[0].FirstName + ', ' + cts[0].LastName);

Contact[] cts = [SELECT Account.Name FROM Contact 
                 WHERE FirstName = 'Carol' AND LastName='Ruiz'];
Contact carol = cts[0];
String acctName = carol.Account.Name;
System.debug('Carol\'s account name is ' + acctName);

// By using SOQL for loops, you can avoid hitting the heap size limit.
// SOQL `for` loops iterate over all of the sObject records returned by a SOQL query.
for (variable : [soql_query]) {
    code_block
}

for (variable_list : [soql_query]) {
    code_block
}

// Both variable and variable_list must be of the same type as the sObjects that are returned by the soql_query

insert new Account[]{new Account(Name = 'for loop 1'), 
                     new Account(Name = 'for loop 2'), 
                     new Account(Name = 'for loop 3')};
// The sObject list format executes the for loop once per returned batch
// of records
Integer i=0;
Integer j=0;
for (Account[] tmp : [SELECT Id FROM Account WHERE Name LIKE 'for loop _']) {
    j = tmp.size();
    i++;
}
System.assertEquals(3, j); // The list should have contained the three accounts
                       // named 'yyy'
System.assertEquals(1, i); // Since a single batch can hold up to 200 records and,
                       // only three records should have been returned, the 
                       // loop should have executed only once


List<Account> aa = [SELECT Id, Name FROM Account WHERE Name = 'Acme'];
//From this list access individual elements:
if (!aa.isEmpty) {
    //....
}

//create new object from existing query
Contact c = new Contact(Account = [SELECT Name FROM Account 
    WHERE NumberOfEmployees > 10 LIMIT 1]);
c.FirstName = 'James';
c.LastName = 'Joyce';

// The count method can be used to return the number of rows returned by a query. 
// The following example returns the total number of contacts with the last name of Weissman:
Integer i = [SELECT COUNT() FROM Contact WHERE LastName = 'Weissman'];
