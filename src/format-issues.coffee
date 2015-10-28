formatRef = ({ user, repo, number, title, url }) ->
  "#{user}/#{repo}\##{number} #{title} #{url}"

module.exports = (issues) ->
  issues
  .map (i) ->
    { user, repo, number, title, url, refs } = i
    ref = if refs.length > 0
      '\n' + refs.map(formatRef).map((j) -> '    ' + j).join('\n')
    else
      ''
    "#{user}/#{repo}\##{number} #{title} #{url}" + ref
  .join '\n'
