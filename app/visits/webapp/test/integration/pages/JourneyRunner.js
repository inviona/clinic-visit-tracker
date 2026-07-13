sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"clinic/app/visits/test/integration/pages/VisitsList.gen",
	"clinic/app/visits/test/integration/pages/VisitsObjectPage.gen"
], function (JourneyRunner, VisitsListGenerated, VisitsObjectPageGenerated) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('clinic/app/visits') + '/test/flp.html#app-preview',
        pages: {
			onTheVisitsListGenerated: VisitsListGenerated,
			onTheVisitsObjectPageGenerated: VisitsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

