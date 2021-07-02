Apex triggers.


Trigger Syntax. 

trigger TriggerName on ObjectName (trigger_events) {

code_block
}

To execute a trigger before or after insert, update, delete, and undelete operations, specify multiple trigger events in a comma-separated list. The events you can specify are:
before insert
before update
before delete
after insert
after update
after delete
after undelete


Before triggers are used to update or validate record values before they’re saved to the database.
After triggers are used to access field values that are set by the system (such as a record's Id or LastModifiedDate field), 
and to affect changes in other records. The records that fire the after trigger are read-only.




LeadProcessor myLeads = new LeadProcessor();
Id batchId = Database.executeBatch(myLeads);