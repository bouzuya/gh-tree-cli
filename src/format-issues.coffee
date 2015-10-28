formatChildren = ({ user, repo, number, title, url }) ->
  "#{user}/#{repo}\##{number} #{title} #{url}"

module.exports = (issues) ->
  issues
  .map (i) ->
    { children, user, repo, number, title, url } = i
    children = if children.length > 0
      '\n' + children.map(formatChildren).map((j) -> '    ' + j).join('\n')
    else
      ''
    "#{user}/#{repo}\##{number} #{title} #{url}" + children
  .join '\n'
