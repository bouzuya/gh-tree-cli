{ Promise } = require 'es6-promise'
assign = require 'object-assign'
fetchIssues = require './fetch-issues'

fetchAll = (repos) ->
  repos.reduce (promise, { user, repo }) ->
    promise
    .then (issues) ->
      fetchIssues { user, repo }
      .then (newIssues) ->
        issues.concat newIssues
  , Promise.resolve([])

addParent = (issues) ->
  issues.map (issue) ->
    m = (issue.body ? '').match /^(?:([^\/]+)\/([^#]+))?#(\d+)/
    return assign({}, issue, { parent: null }) unless m?
    [_, u, r, ns] = m
    u ?= issue.user
    r ?= issue.repo
    n = parseInt ns, 10
    assign {}, issue, { parent: { user: u, repo: r, number: n } }

addChildren = (issues) ->
  issues.map (issue) ->
    { user, repo, number } = issue
    assign {}, issue, children: issues.filter (i) ->
      p = i.parent
      p? and p.user is user and p.repo is repo and p.number is number

module.exports = (repos) ->
  fetchAll repos
  .then addParent
  .then addChildren
