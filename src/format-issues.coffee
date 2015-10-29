table = require 'table-b'

formatChild = ({ user, repo, number, title, url }) ->
  ["    #{user}/#{repo}\##{number}", '    ' + title, '    ' + url]

module.exports = (issues, root) ->
  rows = issues
  .filter (i) ->
    return true unless root?
    { user, repo } = root
    i.user is user and i.repo is repo
  .reduce (rows, i) ->
    { children, user, repo, number, title, url } = i
    parent = ["#{user}/#{repo}\##{number}", title, url]
    rows
    .concat [parent]
    .concat children.map formatChild
  , []
  table rows
