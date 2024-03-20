using TravelService as service from '../../srv/travel-service';
using from '../../db/schema';
using from '../capabilities';


annotate service.Travel with @(
    UI.SelectionFields: [
        to_Agency.AgencyID,
        to_Customer.CustomerID,
        TravelStatus_code,
    ],
    UI.LineItem       : [
        {
            $Type: 'UI.DataField',
            Value: TravelID,
            Label: 'Travel ID',
        },
        {
            $Type: 'UI.DataField',
            Value: BeginDate,
        },
        {
            $Type: 'UI.DataField',
            Value: BookingFee,
        },
        {
            $Type: 'UI.DataField',
            Value: TotalPrice,
        },
        {
            $Type      : 'UI.DataField',
            Label      : 'Travel Status',
            Value      : TravelStatus_code,
            Criticality: TravelStatus.criticality
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : 'Accept Travel',
            Action: 'TravelService.acceptTravel',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : 'Reject Travel',
            Action: 'TravelService.rejectTravel',
        }
    ],
);

annotate service.Travel with @(UI.HeaderInfo: {
    TypeName      : 'Travel',
    TypeNamePlural: 'Travels',
    Title         : {
        $Type: 'UI.DataField',
        Value: TravelID,
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: Description,
    },
});

annotate service.Travel with @(UI.Identification: [
    {
        $Type : 'UI.DataFieldForAction',
        Action: 'TravelService.acceptTravel',
        Label : '{i18n>AcceptTravel}',
    },
    {
        $Type : 'UI.DataFieldForAction',
        Action: 'TravelService.rejectTravel',
        Label : '{i18n>RejectTravel}',
    },
]);

annotate service.Travel with @(
    UI.Facets                : [{
        $Type : 'UI.CollectionFacet',
        Label : '{i18n>Travel}',
        ID    : 'i18nTravel',
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{i18n>Travel}',
                ID    : 'i18nTravel1',
                Target: '@UI.FieldGroup#i18nTravel1',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{i18n>Dates}',
                ID    : 'i18nDates',
                Target: '@UI.FieldGroup#i18nDates1',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{i18n>Price}',
                ID    : 'i18nPrice',
                Target: '@UI.FieldGroup#i18nPrice',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{i18n>Sustainability}',
                ID    : 'i18nSustainability',
                Target: '@UI.FieldGroup#i18nSustainability1',
            },
        ],
    }, ],
    UI.FieldGroup #i18nTravel: {
        $Type: 'UI.FieldGroupType',
        Data : [],
    }
);


annotate service.Travel with @(UI.FieldGroup #i18nTravel1: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: TravelID,
            Label: 'TravelID',
        },
        {
            $Type: 'UI.DataField',
            Value: to_Agency_AgencyID,
            Label: 'AgencyID',
        },
        {
            $Type: 'UI.DataField',
            Value: to_Customer.CustomerID,
            Label: 'CustomerID',
        },
        {
            $Type      : 'UI.DataField',
            Value      : TravelStatus_code,
            Label      : 'TravelStatus',
            Criticality: TravelStatus.criticality,
        },
    ],
});

annotate service.Travel with @(UI.FieldGroup #i18nDates1: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: BeginDate,
            Label: 'BeginDate',
        },
        {
            $Type: 'UI.DataField',
            Value: EndDate,
            Label: 'EndDate',
        },
    ],
});

annotate service.Travel with @(UI.FieldGroup #i18nPrice: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: TotalPrice,
            Label: 'TotalPrice',
        },
        {
            $Type: 'UI.DataField',
            Value: BookingFee,
            Label: 'BookingFee',
        },
    ],
});

annotate service.Travel with @(UI.FieldGroup #i18nSustainability1: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: GoGreen,
            Label: 'GoGreen',
        },
        {
            $Type: 'UI.DataField',
            Value: GreenFee,
            Label: 'GreenFee',
        },
        {
            $Type: 'UI.DataField',
            Value: TreesPlanted,
            Label: 'Trees Planted'
        }
    ],
});

annotate service.Booking with @(UI.LineItem #i18nBookings: [
    {
        $Type: 'UI.DataField',
        Value: to_Carrier.AirlinePicURL,
        Label: 'AirlinePicURL',
    },
    {
        $Type : 'UI.DataFieldForAnnotation',
        Target: '@UI.Chart#BookedFlights',
        Label : 'BookedFlights',
    },
    {
        $Type: 'UI.DataField',
        Value: BookingID,
        Label: 'BookingID',
    },
    {
        $Type: 'UI.DataField',
        Value: BookingStatus_code,
        Label: 'BookingStatus_code',
    },
    {
        $Type: 'UI.DataField',
        Value: FlightDate,
        Label: 'FlightDate',
    },
    {
        $Type: 'UI.DataField',
        Value: to_Customer_CustomerID,
        Label: 'to_Customer_CustomerID',
    },
    {
        $Type: 'UI.DataField',
        Value: to_Carrier_AirlineID,
        Label: 'to_Carrier_AirlineID',
    },
]);

annotate service.Booking with @(
    UI.DataPoint #BookedFlights: {
        Value      : BookedFlights,
        TargetValue: to_Carrier.VIPCustomerBookings,
        Criticality: EligibleForPrime,
    },
    UI.Chart #BookedFlights    : {
        ChartType        : #Donut,
        Measures         : [BookedFlights, ],
        MeasureAttributes: [{
            DataPoint: '@UI.DataPoint#BookedFlights',
            Role     : #Axis1,
            Measure  : BookedFlights,
        }, ],
    }
);

annotate service.BookedFlights with @(UI.Chart #BookingsChart: {
    $Type              : 'UI.ChartDefinitionType',
    Description        : 'Flights Booked by CustomerID',
    Title              : 'Flights Booked by CustomerID',
    ChartType          : #Column,
    Dimensions         : [
        to_Customer_CustomerID,
        AirlineID,
    ],
    DimensionAttributes: [
        {
            $Type    : 'UI.ChartDimensionAttributeType',
            Dimension: to_Customer_CustomerID,
            Role     : #Category,
        },
        {
            $Type    : 'UI.ChartDimensionAttributeType',
            Dimension: AirlineID,
            Role     : #Series,
        },
    ],
    Measures           : [CountFlights, ],
    MeasureAttributes  : [{
        $Type  : 'UI.ChartMeasureAttributeType',
        Measure: CountFlights,
        Role   : #Axis1,
    }, ],
});
