fetchIssues = require './fetch-issues'
fetchRefs = require './fetch-refs'

main = ({ user, repo }) ->
  fetchIssues { user, repo }
  .then (issues) ->
    issues.reduce (promise, issue) ->
      promise
      .then ->
        fetchRefs issue
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
