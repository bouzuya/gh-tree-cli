fetchIssuesWithChildren = require './fetch-issues-with-children'
formatIssues = require './format-issues'
getVersion = require './get-version'
command = require 'commander-b'

parseRepos = (reposCsv) ->
  reposCsv.split(/,/).map (i) ->
    [user, repo] = i.split(/\//)
    { user, repo }

module.exports = ->
  command('gh-tree-cli <reposCsv>')
  .version(getVersion())
  .action (reposCsv) ->
    fetchIssuesWithChildren parseRepos reposCsv
    .then (issues) ->
      console.log formatIssues issues
    .catch (e) ->
      console.error e
  .execute()
