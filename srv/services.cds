using { clinic } from '../db/schema';
service ClinicService {
  entity Patients as projection on clinic.Patients excluding { visits };
  entity Doctors  as projection on clinic.Doctors;
  entity Visits   as projection on clinic.Visits;
}
annotate ClinicService @requires : 'viewer';
annotate ClinicService.Patients @restrict : [
  { grant: '*', to: 'admin' },
  { grant: 'READ', to: 'viewer' }
];
annotate ClinicService.Doctors @restrict : [
  { grant: '*', to: 'admin' },
  { grant: 'READ', to: 'viewer' }
];
annotate ClinicService.Visits @restrict : [
  { grant: '*', to: 'admin' },
  { grant: 'READ', to: 'viewer' }
];

annotate ClinicService.Visits with @odata.draft.enabled;
annotate ClinicService.Patients with @odata.draft.enabled;
annotate ClinicService.Doctors  with @odata.draft.enabled;