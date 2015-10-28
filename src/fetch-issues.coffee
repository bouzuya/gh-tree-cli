request = require './gh-request'

module.exports = ({ user, repo }) ->
  request
    method: 'GET'
    url: "https://api.github.com/repos/#{user}/#{repo}/issues"
    json: true
  .then ({ body }) ->
    body.map (i) ->
      { html_url, number, title, body } = i
      { body, number, title, repo, url: html_url, user }
