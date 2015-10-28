fs = require 'fs'
path = require 'path'

module.exports = ->
  packageJson = path.join __dirname, '..', 'package.json'
  data = fs.readFileSync packageJson, encoding: 'utf-8'
  json = JSON.parse data
  json.version
