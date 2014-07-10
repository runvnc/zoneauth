#args: domain revipaddr
import os, osproc, re

var domain = paramStr(1)
var revip = paramStr(2)

var args="./descrzone " & domain & " " & revip
var descr=execProcess(args)

var nsdconf = readFile("/etc/nsd/nsd.conf")

var tofind = r"\nzone.+\n\tname\:\ " & domain & r"\n(.*)\#x"
var toreplace = descr

var newconf = nsdconf.replace(re(tofind, {reMultiLine, reDotAll, reExtended, reStudy}), toreplace)

writeFile("/etc/nsd/nsd.conf", newconf)


