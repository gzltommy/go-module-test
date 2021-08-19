module mod1

go 1.16

require (
	nothing.com/mod2 v0.0.0  // 随便起的域名，经过替换repalce，不会下载东西
	nothing.com/mod3 v0.0.0 // indirect
)

replace nothing.com/mod2 => ../mod2
replace nothing.com/mod3 => ../mod3