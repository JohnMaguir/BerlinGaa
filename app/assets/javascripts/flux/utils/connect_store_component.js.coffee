# connects to a store so you don't have to do it in every root component
class ConnectStoreComponent extends React.Component
  constructor: (props) ->
    super(props)
    @state = @props.store.getInitialState()

  @propTypes:
    store: React.PropTypes.object.isRequired
    child: React.PropTypes.func.isRequired

  componentDidMount: ->
    @unsubscribe = @props.store.listen (state) => @setState(state)

  componentWillUnmount: ->
    @unsubscribe()

  render: ->
    @props.child(@state)

# it expects a child class not a factory
module.exports = (ChildClass, store) ->
  childFactory = React.createFactory(ChildClass)
  React.createElement ConnectStoreComponent,
  child: childFactory
  store: store
