WhereSpecification = require('./where_specification')

module.exports = Criteria =
  where: (condition) ->
    new WhereSpecification(condition)

