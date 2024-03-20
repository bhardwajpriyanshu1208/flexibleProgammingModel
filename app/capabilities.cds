using {TravelService} from '../srv/travel-service';

annotate TravelService.BookedFlights with @(
    Aggregation.ApplySupported    : {
        $Type                 : 'Aggregation.ApplySupportedType',
        Transformations       : [
            'aggregate',
            'groupby'
        ],
        Rollup                : #None,
        GroupableProperties   : [
            to_Customer_CustomerID,
            AirlineID
        ],
        AggregatableProperties: [{
            $Type   : 'Aggregation.AggregatablePropertyType',
            Property: BookingUUID
        }, ],
    },
    Analytics.AggregatedProperties: [{
        Name                : 'CountFlights',
        AggregationMethod   : 'countdistinct',
        AggregatableProperty: BookingUUID,
        ![@Common.Label]    : 'Booked Flights per Airline',
    }]
);
