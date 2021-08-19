# 这个项目内包含三个 project（即，有 3 个 module），其中 mod1 引用 mod2，mod2 引用 mod3
mod1
    go.mod
    main.go
mod2
    go.mod
    mod2.go
mod3
    go.mod
    mod3.go
    
# 简单说一下实验设计的目的：
上面 mod1 是我要进行编译的 module，mod1 直接引用 mod2，mod2 直接依赖 mod3，所以 mod1 间接依赖 mod3，mod1/go.mod 也证明了这点。
但是注意，mod2/go.mod 中，我给出的 replace 是一个错误的地址，这个文件夹是不存在的，此外，我在 mod1/go.mod 给出了正确的 replace。    

# 实验结果
```
$ cd mod1
$ go build
$ .\mod1
Now in mod2
Now in mod3
```
可以看到，是可以正常编译并执行的，这至少说明了两个问题：
* mod1 中的 replace 直接覆盖了全局的 replace，不然的话，mod2 是肯定找不到 mod3 的；
* replace 会对间接依赖生效，因为 mod1 就是间接依赖 mod3。

# 结果分析
只有当前 build 的 module 的 replace 会被保留，其它的都会被忽略，所以才有了上面的实验结果。当然这些都是我结合实验和文档给出的一些理解推测，可能会有一定的偏差。