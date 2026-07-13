using ClinicService as service from '../../srv/services';
annotate service.Doctors with {
    firstName   @title : 'First Name';
    lastName    @title : 'Last Name';
    specialty   @title : 'Specialty';
    email       @title : 'Email';
};
annotate service.Doctors with @cds.search : { firstName, lastName };
annotate service.Doctors with @(
    UI.SelectionFields : [ firstName, lastName, specialty ],
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'firstName',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'specialty',
                Value : specialty,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'firstName',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'specialty',
            Value : specialty,
        },
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
    ],
);

