# hcli

CmdArgs sample code

## run command

```
$ stack exec -- --help
The hcli program

hcli [OPTIONS]
  command line option sample

Common flags:
  -t --type=CALCTYPE --calctype  calculate type fib or sum
  -m --max=INT --maxint          calculate number set 1 to 100
  -? --help                      Display help message
  -V --version                   Print version information
```

* Usage

```
$ stack run -- -t fib -m 10
Fibonacci 10 : [1,1,2,3,5,8,13,21,34,55]
$ stack run -- -t fib -m 101
-m is should be set 1 to 100
```
