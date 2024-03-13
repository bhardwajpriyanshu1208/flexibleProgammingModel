using TravelService as service from '../../srv/travel-service';

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
