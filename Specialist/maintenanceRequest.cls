trigger MaintenanceRequest on Case (before update, after update) {
    // ToDo: Call MaintenanceRequestHelper.updateWorkOrders
    Map<Id, Case> caseList = new Map<Id, Case>();
    
    if(Trigger.isUpdate && Trigger.isAfter){
        for(Case o : Trigger.new){
            if (o.IsClosed && (o.Type.equals('Repair') || o.Type.equals('Routine Maintenance'))){
                caseList.put(o.Id, o);
            }
        }
        if (caseList.size() > 0){
            System.debug('Calling updateWorkOrders');
            MaintenanceRequestHelper.updateWorkOrders(caseList);
        }
    }
}