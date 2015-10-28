fetchIssuesWithRefs = require './fetch-issues-with-refs'
formatIssues = require './format-issues'

module.exports = ({ user, repo }) ->
  fetchIssuesWithRefs { repo, user }
  .then (issues) ->
    console.log formatIssues issues
  .catch (e) ->
    console.error e
