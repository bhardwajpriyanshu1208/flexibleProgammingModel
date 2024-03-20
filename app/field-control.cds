using {TravelService} from '../srv/travel-service';


annotate TravelService.Travel {
    Description @Common.FieldControl: TravelStatus.fieldControl;
    BookingFee  @Common.FieldControl: TravelStatus.fieldControl;
    BeginDate   @Common.FieldControl: TravelStatus.fieldControl;
    EndDate     @Common.FieldControl: TravelStatus.fieldControl
} actions {
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

annotate TravelService.Travel with @Common: {SideEffects: {
    $Type           : 'Common.SideEffectsType',
    SourceProperties: [
        GoGreen,
        BookingFee
    ],
    SourceEntities  : [to_Booking],
    TargetProperties: [
        'GreenFee',
        'TotalPrice',
        'TreesPlanted'
    ],
}, };


annotate TravelService.Booking {
    FlightDate    @Common.FieldControl: to_Travel.TravelStatus.fieldControl;
    BookingStatus @Common.FieldControl: to_Travel.TravelStatus.fieldControl;
    BookingDate   @Common.FieldControl: to_Travel.TravelStatus.fieldControl;
};


