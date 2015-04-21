# coding: UTF-8
#
# 例外処理
#

### except
print "---- except ----"

try:
    x = int(raw_input("Please enter a number: "))
except Exception, e:
    print "Except: ", e
else:
    print "例外ではない場合に通る"
finally:
    print "必ず通る"
