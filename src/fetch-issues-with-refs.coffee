{ Promise } = require 'es6-promise'
fetchIssues = require './fetch-issues'
fetchRefs = require './fetch-refs'

module.exports = ({ user, repo }) ->
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
