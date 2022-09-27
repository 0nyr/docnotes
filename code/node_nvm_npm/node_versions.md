# node versions



### commands

`nvm use [version]` : command used in a terminal to select the version of `node` to use. Use `nvm list` to see the LTS versions, go for the last one, also known as `stable`.

```
(base)  ❮ onyr ★  kenzae❯ ❮ ~❯❯ nvm list
       v12.13.0
       v12.19.0
       v14.15.3
->       system
default -> 12.13.0 (-> v12.13.0)
node -> stable (-> v14.15.3) (default)
stable -> 14.15 (-> v14.15.3) (default)
iojs -> N/A (default)
unstable -> N/A (default)
lts/* -> lts/fermium (-> v14.15.3)
lts/argon -> v4.9.1 (-> N/A)
lts/boron -> v6.17.1 (-> N/A)
lts/carbon -> v8.17.0 (-> N/A)
lts/dubnium -> v10.23.0 (-> N/A)
lts/erbium -> v12.20.0 (-> N/A)
lts/fermium -> v14.15.3
(base)  ❮ onyr ★  kenzae❯ ❮ ~❯❯ nvm use v14.15.3
Now using node v14.15.3 (npm v6.14.9)
```
