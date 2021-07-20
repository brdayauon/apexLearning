public with sharing class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(Map<Id,Case> appCases) {
        // TODO: Complete the method to update workorders
        Map<Id, Integer> hm = new Map<Id, Integer>();
        List<Case> newCaseList = new List<Case>();
        
        List<Product2> listProduct = [select Id, Maintenance_Cycle__c from Product2];
        
        for (Product2 product: listProduct){
            if (product != null){
                if(product.Maintenance_Cycle__c != null){
                    hm.put(product.Id, Integer.valueOf(product.Maintenance_Cycle__c));
                }
            }
        }
        for(Case sent: appCases.values()){
            Case newCase = new Case();
            newCase.Vehicle__c = sent.Vehicle__c;
            newCase.Equipment__c = sent.Equipment__c ;
            newCase.Type = 'Routine Maintenance';
            newCase.Status = 'New';
            newCase.Product__c = sent.Product__c;
            newCase.AccountId = sent.AccountId;
            newCase.ContactId = sent.ContactId;
            newCase.AssetId = sent.AssetId;
            newCase.Subject = String.isBlank(sent.Subject) ? 'Routine Maintenance Request' : sent.Subject;
            newCase.Date_Reported__c = Date.today();
            newCase.Origin = sent.Origin;
            newCase.Reason = sent.Reason;
            newCase.Date_Due__c =  (hm.get(sent.Id) != null) ? (Date.today().addDays(Integer.valueOf(hm.get(sent.Id)))) : (Date.today());
            newCaseList.add(newCase);
        }
        if (newCaseList.size() > 0){
            insert newCaseList;
        }
    }        
    
}