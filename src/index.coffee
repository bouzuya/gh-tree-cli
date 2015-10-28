fetchIssuesWithRefs = require './fetch-issues-with-refs'
formatIssues = require './format-issues'
getVersion = require './get-version'
command = require 'commander-b'

module.exports = ->
  command()
  .version(getVersion())
  .option '-u, --user <user>', 'user'
  .option '-r, --repo <repo>', 'repo'
  .action ({ user, repo }) ->
    fetchIssuesWithRefs { repo, user }
    .then (issues) ->
      console.log formatIssues issues
    .catch (e) ->
      console.error e
  .execute()
