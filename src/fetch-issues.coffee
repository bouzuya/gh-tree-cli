request = require './gh-request'

module.exports = (token, { user, repo }) ->
  request
    method: 'GET'
    url: "https://api.github.com/repos/#{user}/#{repo}/issues"
    json: true
    token: token
  .then ({ body }) ->
    body.map (i) ->
      { html_url, number, title, body } = i
      { body, number, title, repo, url: html_url, user }
