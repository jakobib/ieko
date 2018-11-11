#!/usr/bin/env node

const fs = require("fs")

let aliases = {}
fs.readFileSync('citekeys.csv').toString().split(/[\n\r]/)
.filter( line => line.match(/,Q[1-9][0-9]*$/) )
.forEach( line => {
  [ alias, key ] = line.split(",")
  aliases[key] = alias
})

let items = []
process.argv.slice(2).forEach( file => {
  JSON.parse(fs.readFileSync(file)).forEach( item => {
    if (aliases[item.id]) {
        item.note = item.id
        items.push(item)
        item = JSON.parse(JSON.stringify(item))
        item.id = aliases[item.id]
        items.push(item)
    }
  })
})

process.stdout.write(JSON.stringify(items))
