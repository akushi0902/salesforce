@isTest
private class LeadServiceTest {

    @testSetup
    static void setupData() {
        List<Lead> leads = new List<Lead>();

        for (Integer i = 0; i < 5; i++) {
            leads.add(new Lead(
                LastName = 'TestLead_' + i,
                Company = 'TestCompany'
            ));
        }

        insert leads;
    }

    @isTest
    static void testCreateLeads_Positive() {

        List<Lead> newLeads = new List<Lead>{
            new Lead(LastName = 'John', Company = 'ABC Corp'),
            new Lead(LastName = 'Mike', Company = 'XYZ Ltd')
        };

        Test.startTest();
        List<Lead> result = LeadService.createLeads(newLeads);
        Test.stopTest();

        System.assertEquals(2, result.size());

        // Verify default status
        Lead l = [SELECT Status FROM Lead WHERE LastName = 'John' LIMIT 1];
        System.assertEquals('New', l.Status);
    }

    @isTest
    static void testCreateLeads_Negative() {

        List<Lead> newLeads = new List<Lead>{
            new Lead(Company = 'ABC') // Missing LastName
        };

        Test.startTest();
        try {
            LeadService.createLeads(newLeads);
            System.assert(false, 'Exception expected');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Last Name is required'));
        }
        Test.stopTest();
    }

    @isTest
    static void testMarkLeadsQualified() {

        List<Lead> leads = [SELECT Id, Status FROM Lead LIMIT 3];

        Test.startTest();
        LeadService.markLeadsQualified(leads);
        Test.stopTest();

        List<Lead> updated = [SELECT Status FROM Lead WHERE Id IN :leads];

        for (Lead l : updated) {
            System.assertEquals('Qualified', l.Status);
        }
    }

    @isTest
    static void testBulkInsertLeads() {

        List<Lead> bulkLeads = new List<Lead>();

        for (Integer i = 0; i < 200; i++) {
            bulkLeads.add(new Lead(
                LastName = 'BulkLead_' + i,
                Company = 'Bulk Corp'
            ));
        }

        Test.startTest();
        LeadService.createLeads(bulkLeads);
        Test.stopTest();

        Integer countLeads = [SELECT COUNT() FROM Lead WHERE LastName LIKE 'BulkLead_%'];
        System.assertEquals(200, countLeads);
    }
}