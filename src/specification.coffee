Module = require('./module')
OrSpecification = require('./or_specification')
NotSpecification = require('./not_specification')

module.exports = Specification =
  or: (other_specification) ->
    new OrSpecification(this, other_specification)
  not: ->
    new NotSpecification(this)
