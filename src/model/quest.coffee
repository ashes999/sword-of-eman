window.Model ||= {}


###
# Base type with common attributes. Handles factory-like construction.
# Delegates to specific types, eg. new IntroductionQuest
###
class window.Model.Quest

  @validTypes = ['Introduction', 'Main', 'FinalBattle']
  
  constructor: (@type) ->
  
  @create: (type) ->
    # TODO: randomly create a type of this.
    validate(type)

    # Create based on type, eg. "Introduction" creates a new IntroductionQuest    
    return new window["#{type}Quest"]()
  
  toString: () ->
    @type
  
  ## private methods ##
  
  validate = (type) ->
    throw "Invalid quest of type '#{type}'" if type not in Quest.validTypes
