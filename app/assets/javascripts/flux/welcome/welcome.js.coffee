{ div, span, a } = React.DOM
ConnectStoreComponent = require '../utils/connect_store_component'
actions = require './actions'

class Welcome extends React.Component
  @propTypes:
    text: React.PropTypes.string

  @defaultProps:
    text: "Well if it isn't react"

  render: ->
    div {},
      span {}, @props.text
      a { onClick: actions.changeMessage }, ' change text'

module.exports = (store) -> ConnectStoreComponent(Welcome, store)
