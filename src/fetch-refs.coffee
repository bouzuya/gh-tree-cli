{ Promise } = require 'es6-promise'
cheerio = require 'cheerio'
request = require './gh-request'

module.exports = (issue) ->
  return Promise.resolve(issue.refs) if issue.refs?
  { number, repo, user } = issue
  request
    method: 'GET'
    url: "https://github.com/#{user}/#{repo}/issues/#{number}"
  .then ({ body }) ->
    $ = cheerio.load body
    refs = []
    $('.discussion-item-ref').each ->
      $e = $ @
      $l = $e.find '.title-link'
      numberString = $e.find('.issue-num').text().trim().substring(1)
      number = parseInt numberString, 10
      title = $l.contents().first().text().trim()
      url = 'https://github.com' + $l.attr 'href'
      refs.push { number, repo, title, user, url }
    refs
