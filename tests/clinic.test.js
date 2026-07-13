const cds = require('@sap/cds')
const { GET, POST, expect } = cds.test(__dirname + '/..')

// admin identity for HTTP requests
const admin = { auth: { username: 'admin' } }

// admin identity for in-process calls
const adminCtx = { user: new cds.User({ id: 'admin', roles: ['admin', 'viewer'] }) }

describe('ClinicService', () => {

  //  GET main entity collection expected record count
  it('GET Visits returns the seeded records', async () => {
    const { data } = await GET('/odata/v4/clinic/Visits', admin)
    expect(data.value.length).to.eql(7)
  })

  // GET single entity by key: verify field values
  it('GET a single Patient by key returns correct fields', async () => {
  const { data } = await GET(
    `/odata/v4/clinic/Patients(ID=7a1e0001-1111-4a01-9001-000000000001,IsActiveEntity=true)`, admin)
    expect(data.firstName).to.eql('Arta')
    expect(data.lastName).to.eql('Krasniqi')
  })

  // POST a new record: verify it is created correctly
  it('POST creates a new doctor', async () => {
    const { status, data } = await POST('/odata/v4/clinic/Doctors', {
      firstName: 'Test',
      lastName: 'Doctor',
      specialty: 'Neurology',
      email: 'test.doctor@clinic.com'
    }, admin)
    expect(status).to.eql(201)
    expect(data.lastName).to.eql('Doctor')
  })

  //  custom handler: enrichment rule (default status)
  it('handler defaults status to Scheduled on create', async () => {
    const srv = await cds.connect.to('ClinicService')
    const { Visits } = srv.entities
    await cds.tx(adminCtx, async () => {
      await srv.create(Visits).entries({
        visitDate: '2027-01-15',
        diagnosis: 'Programmatic test visit',
        patient_ID: '7a1e0001-1111-4a01-9001-000000000002',
        doctor_ID:  'd0c70001-2222-4b02-9002-000000000001'
      })
      const [row] = await srv.read(Visits).where({ diagnosis: 'Programmatic test visit' })
      expect(row.status).to.eql('Scheduled')
    })
  })

  // custom handler: validation rule (no past visits)
  it('handler rejects a visit dated in the past', async () => {
    const srv = await cds.connect.to('ClinicService')
    const { Visits } = srv.entities
    await cds.tx(adminCtx, async () => {
      await expect(srv.create(Visits).entries({
        visitDate: '2020-01-01',
        diagnosis: 'Should fail',
        patient_ID: '7a1e0001-1111-4a01-9001-000000000002',
        doctor_ID:  'd0c70001-2222-4b02-9002-000000000001'
      })).to.be.rejectedWith(/in the past/)
    })
  })

  //authorization: request without required role is rejected
  it('viewer role is rejected from creating visits', async () => {
    await expect(POST('/odata/v4/clinic/Visits', {
      visitDate: '2027-02-01',
      diagnosis: 'Alice should not do this',
      patient_ID: '7a1e0001-1111-4a01-9001-000000000002',
      doctor_ID:  'd0c70001-2222-4b02-9002-000000000001'
    }, { auth: { username: 'alice' } })).to.be.rejectedWith(/403/)
  })

})