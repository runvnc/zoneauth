# reads stdin output to stdout
# replacebetween "start xxx" "end xxx" "start xxx\nmodified\end xxx"
import os, strutils

proc replacespecial(s: string): string =
  var news = s.replace("\\t", "\t")
  return news.replace("\\n", "\n")

var startswith = replacespecial(paramStr(1))
var endswith = replacespecial(paramStr(2))
var replacewith = replacespecial(paramstr(3))

var lines: seq[string] = @[]
for line in stdin.lines:
  lines.add(line)

var i = 0
var found = false

while (not found) and i < lines.len:
  found = ( lines[i].contains(startswith) )
  if not found:
    echo lines[i]
  i += 1

var foundend = false
if found:
  echo replaceWith
  foundend = ( lines[i].contains(endswith) )
  while (not foundend) and i < lines.len:
    i += 1
    foundend = ( lines[i].contains(endswith) )
    if foundend: i += 1

while i < lines.len:
  echo lines[i]
  i += 1

