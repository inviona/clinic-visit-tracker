sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"patients/test/integration/pages/PatientsList.gen",
	"patients/test/integration/pages/PatientsObjectPage.gen"
], function (JourneyRunner, PatientsListGenerated, PatientsObjectPageGenerated) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('patients') + '/test/flp.html#app-preview',
        pages: {
			onThePatientsListGenerated: PatientsListGenerated,
			onThePatientsObjectPageGenerated: PatientsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

