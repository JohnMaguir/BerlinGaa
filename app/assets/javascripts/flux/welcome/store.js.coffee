actions = require './actions'

store = Reflux.createStore
  init: ->
    @model = text: 'All the way from the store'
    @listenToMany(actions)

  getInitialState: -> @model

  onChangeMessage: ->
    @model = text: 'Changed welcome message'
    @trigger(@model)

module.exports = store
