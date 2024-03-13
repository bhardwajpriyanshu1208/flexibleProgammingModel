using {TravelService} from '../srv/travel-service';


annotate TravelService.Travel {} actions {
    acceptTravel @(
        Core.OperationAvailable: {$edmJson: {$Ne: [
            {$Path: 'in/TravelStatus_code'},
            'A'
        ]}},
        Common.SideEffects     : {
            $Type           : 'Common.SideEffectsType',
            TargetProperties: ['in/TravelStatus_code', ],
            TargetEntities  : ['/TravelService.EntityContainer/Travel'],
        }
    );

    rejectTravel @(
        Core.OperationAvailable: {$edmJson: {$Ne: [
            {$Path: 'in/TravelStatus_code'},
            'X'
        ]}},
        Common.SideEffects     : {
            $Type           : 'Common.SideEffectsType',
            TargetProperties: ['in/TravelStatus_code', ],
            TargetEntities  : ['/TravelService.EntityContainer/Travel'],
        }
    )
};
