cheerio = require 'cheerio'
request = require './gh-request'
fetchIssues = require './fetch-issues'

fetchRefs = ({ user, repo, number }) ->
  request
    method: 'GET'
    url: "https://github.com/#{user}/#{repo}/issues/#{number}"
  .then ({ body }) ->
    $ = cheerio.load body
    refs = []
    $('.discussion-item-ref').each ->
      $e = $ @
      $l = $e.find '.title-link'
      number = $e.find('.issue-num').text().trim()
      title = $l.contents().first().text().trim()
      url = 'https://github.com' + $l.attr 'href'
      ref = [number, title, url].join ' '
      refs.push ref
    refs

main = ({ user, repo }) ->
  fetchIssues { user, repo }
  .then (issues) ->
    issues.reduce (promise, issue) ->
      promise
      .then ->
        number = issue.number
        fetchRefs { user, repo, number }
      .then (refs) ->
        issue.refs = refs
    , Promise.resolve()
    .then ->
      issues
  .then (issues) ->
    issues
    .map (i) ->
      { html_url, title, number, refs } = i
      ref = if refs.length > 0
        '\n' + refs.map((j) -> '    ' + j).join('\n')
      else
        ''
      "\##{number} #{title} #{html_url}" + ref
    .join '\n'
  .catch (e) ->
    console.error e

main
  user: 'bouzuya'
  repo: 'blog.bouzuya.net'
