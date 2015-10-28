fetchIssuesWithRefs = require './fetch-issues-with-refs'

module.exports = ({ user, repo }) ->
  fetchIssuesWithRefs { repo, user }
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
