# coding: UTF-8
#
# 条件分岐
#

### if
# 条件分岐のブロックの中はインデントの深さで判断しています
print "---- if ----"

int = 50
if int > 20:
    print "true"

if int > 20 and int < 60:
    print "true"

if 20 < int < 60:
    print "true"

if int < 50:
    print "if"
elif int < 60:
    print "elif"
else:
    print "else"

# 変わった書き方
print "true" if int < 50 else "false"
