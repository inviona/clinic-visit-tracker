const cds = require('@sap/cds')

module.exports = function () {
  const { Visits } = this.entities

  this.before('CREATE', Visits, (req) => {
    if (!req.data.status) {
      req.data.status = 'Scheduled'
    }
  })

  this.before('CREATE', Visits, (req) => {
  const { visitDate, status } = req.data

  // No visits in the past
  const today = new Date().toISOString().slice(0, 10)
    if (visitDate && visitDate < today) {
        req.error(400, `Visit date ${visitDate} is in the past — visits can only be scheduled for today or later.`)
    }

    // Default status
    if (!status) req.data.status = 'Scheduled'
  })

  this.before('UPDATE', Visits, async (req) => {
    const visit = await SELECT.one.from(Visits).where({ ID: req.data.ID })
    if (visit && ['Completed', 'Cancelled'].includes(visit.status)) {
      req.error(400, `Cannot edit a visit with status "${visit.status}".`)
    }
  })
}
