request = require './request'

module.exports = (params) ->
  params.headers ?= {}
  params.headers['Accept'] = 'application/vnd.github.v3+json'
  params.headers['User-Agent'] = 'gh-tree'
  request params
  .then ({ response, body }) ->
    code = response.statusCode
    throw new Error "#{code} #{body.message}" unless code is 200
    { response, body }
