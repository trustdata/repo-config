'use strict'

/**
 * Dependencies
 */
const cwd = process.cwd()
const path = require('path')
const fs = require('fs')

/**
 * Env
 */
const scriptDir = __dirname

/**
 * Args
 */
const args = process.argv.slice(2)
const [ packageName ] = args

/**
 * Config
 */
const config = require(path.join(scriptDir, 'config.json'))

// parse package.json
let packageData

try {
  let json = fs.readFileSync(path.join(cwd, 'package.json'), 'utf8')
  packageData = JSON.parse(json)
} catch (error) {
  console.error(error)
  process.exit(1)
}

// configured stuff
Object.assign(packageData, config)

// package name
if (packageName) {
  packageData.name = packageName
}

// stringify
let stringified = JSON.stringify(packageData, null, 2)

// write to file
try {
  fs.writeFileSync(path.join(cwd, 'package.json'), stringified)
} catch (error) {
  console.error(error)
  process.exit(1)
}
