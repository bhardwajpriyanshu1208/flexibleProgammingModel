sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'scm/nxt/fpm/fpm/test/integration/FirstJourney',
		'scm/nxt/fpm/fpm/test/integration/pages/TravelMain'
    ],
    function(JourneyRunner, opaJourney, TravelMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('scm/nxt/fpm/fpm') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTravelMain: TravelMain
                }
            },
            opaJourney.run
        );
    }
);