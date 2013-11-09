Module = require('./module')
OrSpecification = require('./or_specification')

module.exports = Specification =
  or: (other_specification) ->
    new OrSpecification(this, other_specification)
