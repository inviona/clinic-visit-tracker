namespace clinic;

using { cuid, managed } from '@sap/cds/common';

entity Patients : cuid, managed {
  firstName   : String(50);
  lastName    : String(50);
  dateOfBirth : Date;
  email       : String(100);
  phone       : String(30);
  bloodType   : String(5);    // a+, o-
  visits      : Composition of many Visits on visits.patient = $self;
}

entity Doctors : cuid, managed {
  firstName   : String(50);
  lastName    : String(50);
  specialty   : String(60);   // cardiology, general practice...
  email       : String(100);
  visits      : Association to many Visits on visits.doctor = $self;
}

entity Visits : cuid, managed {
  patient        : Association to Patients;
  doctor         : Association to Doctors;
  visitDate      : Date;
  diagnosis      : String(200);
  notes          : String(500);
  status         : String(20);   // Scheduled, Completed, Cancelled
  followUpNeeded : Boolean default false;
}