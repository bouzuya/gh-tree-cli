request = require './request'

module.exports = (params) ->
  params.headers ?= {}
  params.headers['User-Agent'] = 'gh-tree'
  request params
