moduleKeywords = ['extended', 'included']

module.exports = class Module
  @include: (object) ->
    for key, value of object when key not in moduleKeywords
      @::[key] = value

    object.included?.apply(@)
    this

