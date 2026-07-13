using ClinicService as service from '../../srv/services';
annotate service.Patients with {
    firstName   @title : 'First Name';
    lastName    @title : 'Last Name';
    dateOfBirth @title : 'Date of Birth';
    email       @title : 'Email';
    phone       @title : 'Phone';
    bloodType   @title : 'Blood Type';
};
annotate service.Patients with @cds.search : { firstName, lastName };
annotate service.Patients with @(
    UI.SelectionFields : [ firstName, lastName, bloodType ],
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Value : dateOfBirth,
            },
            {
                $Type : 'UI.DataField',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Value : phone,
            },
            {
                $Type : 'UI.DataField',
                Value : bloodType,
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
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Value : dateOfBirth,
        },
        {
            $Type : 'UI.DataField',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Value : phone,
        },
                {
            $Type : 'UI.DataField',
            Value : bloodType,
        },
    ],
);

