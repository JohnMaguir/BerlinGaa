module.exports = (selector='#welcome') ->
  Welcome = require './welcome'
  store = require './store'
  mount_node = document.querySelector(selector)
  React.render(Welcome(store), mount_node)
