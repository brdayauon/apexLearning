global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> leadsToUpdate = new List<lead>();
        List<Lead> leads = [SELECT Id
            FROM Lead
            WHERE LeadSource = NULL Limit 200
            ];
        for(Lead l: leads){
            l.LeadSource = 'DreamForce';
            leadsToUpdate.add(l);
        }
        update leadsToUpdate;
    }
    
}