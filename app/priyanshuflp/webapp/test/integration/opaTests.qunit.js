sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/flp/priyanshuflp/test/integration/FirstJourney',
		'com/flp/priyanshuflp/test/integration/pages/TravelMain'
    ],
    function(JourneyRunner, opaJourney, TravelMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/flp/priyanshuflp') + '/index.html'
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