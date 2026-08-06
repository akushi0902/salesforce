public with sharing class LeadService {

    // Create Leads with validation + default logic
    public static List<Lead> createLeads(List<Lead> leadList) {

        if (leadList == null || leadList.isEmpty()) {
            return new List<Lead>();
        }

        for (Lead l : leadList) {

            // Validation
            if (String.isBlank(l.LastName)) {
                l.addError('Last Name is required');
            }

            if (String.isBlank(l.Company)) {
                l.addError('Company is required');
            }

            // Default status
            if (String.isBlank(l.Status)) {
                l.Status = 'New';
            }
        }

        insert leadList;
        return leadList;
    }

    // Update Lead status to Qualified
    public static void markLeadsQualified(List<Lead> leadList) {

        if (leadList == null || leadList.isEmpty()) {
            return;
        }

        for (Lead l : leadList) {
            l.Status = 'Qualified';
        }

        update leadList;
    }
}