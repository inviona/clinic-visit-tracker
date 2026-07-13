sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"doctors/test/integration/pages/DoctorsList.gen",
	"doctors/test/integration/pages/DoctorsObjectPage.gen"
], function (JourneyRunner, DoctorsListGenerated, DoctorsObjectPageGenerated) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('doctors') + '/test/flp.html#app-preview',
        pages: {
			onTheDoctorsListGenerated: DoctorsListGenerated,
			onTheDoctorsObjectPageGenerated: DoctorsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

