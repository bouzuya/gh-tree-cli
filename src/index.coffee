fetchIssuesWithChildren = require './fetch-issues-with-children'
formatIssues = require './format-issues'
getVersion = require './get-version'
command = require 'commander-b'

parseRepo = (repoString) ->
  m = (repoString ? '').match(/^([^\/]+)\/(.+)$/)
  return null unless m?
  [_, user, repo] = m
  { user, repo }

parseRepos = (reposCsv) ->
  reposCsv.split(/,/).map(parseRepo).filter (i) -> i?

module.exports = ->
  command('gh-tree-cli <reposCsv>')
  .version(getVersion())
  .option '-r, --root <repo>', 'root repository'
  .action (reposCsv, { root }) ->
    fetchIssuesWithChildren parseRepos reposCsv
    .then (issues) ->
      console.log formatIssues issues, parseRepo root
    .catch (e) ->
      console.error e.message
      throw e
  .execute()
