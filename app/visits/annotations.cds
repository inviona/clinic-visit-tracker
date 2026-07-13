using ClinicService as service from '../../srv/services';

annotate service.Visits with {
    visitDate      @title : 'Visit Date';
    diagnosis      @title : 'Diagnosis';
    notes          @title : 'Notes';
    status         @title : 'Status';
    followUpNeeded @title : 'Follow-up Needed';
    patient        @title : 'Patient';
    doctor         @title : 'Doctor';

};
// annotate service.Doctors with {
//     lastName @title : 'Doctor Last Name';
// };
// annotate service.Patients with {
//     lastName @title : 'Patient Last Name';
// };
annotate service.Visits with @cds.search : {
    diagnosis, notes, status, patient, doctor
};
// annotate service.Patients with @cds.search : { firstName, lastName };
// annotate service.Doctors  with @cds.search : { firstName, lastName };
annotate service.Visits with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : patient_ID,
                Label : 'Patient'
            },
            {
                $Type : 'UI.DataField',
                Value : doctor_ID,
                Label : 'Doctor'
            },
            {
                $Type : 'UI.DataField',
                Value : visitDate,
            },
            {
                $Type : 'UI.DataField',
                Value : diagnosis,
            },
            {
                $Type : 'UI.DataField',
                Value : notes,
            },
            {
                $Type : 'UI.DataField',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Value : followUpNeeded,
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
    UI.SelectionFields : [ status, visitDate, patient.lastName, doctor.lastName ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Patient',
            Value : patient.lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Doctor',
            Value : doctor.lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Visit Date',
            Value : visitDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Diagnosis',
            Value : diagnosis,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Notes',
            Value : notes,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Follow-Up Needed',
            Value : followUpNeeded,
        },
    ],
);
annotate service.Visits with {
    patient @Common.Text : patient.lastName;
    doctor  @Common.Text : doctor.lastName;
};

annotate service.Visits with {
    patient @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Patients',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : patient_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'firstName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'lastName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'dateOfBirth',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
        ],
    }
};

annotate service.Visits with {
    doctor @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Doctors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : doctor_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'firstName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'lastName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'specialty',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
        ],
    }
};

