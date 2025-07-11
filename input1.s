.data
.dword 10, 20, 30, 40, 50
.text
lui x3, 0x10
sd x4, 0(x3)
sd x5, 120(x3)