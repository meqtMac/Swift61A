# Installation 

## Linux/WSL

### Swiftly
[swiftly](https://swiftlang.github.io/swiftly/) A Swift Toolchain installer and manager.

- show kernel and distribution
```sh
# show kernel
uname -a
# show distribution
cat /etc/lsb-release 
```
- update apt
```sh
sudo apt update 
```
- Install [swiftly](https://swiftlang.github.io/swiftly/)
```sh
curl -L https://swiftlang.github.io/swiftly/swiftly-install.sh | bash
``` 

### `.zprofile`
After installation, path configuration was written to `.zprofile` under home directory; `.zprofile` was load each time user login, which means `swiftly` was not added to `$PATH` immediately; to test installation we can first `source ~/.zprofile` to test the installation
```sh
swiftly --version # not found
echo $PATH # path was not added
source .zprofile # here I'm sourcing zprofile becasue I'm using zsh, if you are using bash/fish, other files are needed
echo $PATH # path was added
swiftly --version # 😇
```
as we explained before, `.zprofile` was load each time user login; this way, if we open another terminal this won't work
```sh
swiftly --version # 🧐
```

thus we need to relogin to the current server to activate loading of `.zprofile`
```sh
su - $USER
```
this only for the current terminal, we can reopen wsl to activate it.

### vscode remote connection notes

but this doesn't work if you are using vscode and open another terminal; becasue vscode has a remote server process kept running even if you close terminal; 
```sh
ps aux | grep code-server
```
this way, close and reopen vscode won't trigger `.zprofile` loading. 

to demostrate, I fix comment the line in `.zprofile`, and reopen the vscode. If the file was loaded, then swiftly won't be find.
```sh
which swiftly
```
but it print path to swiftly executable, which means `.zprofile` wasn't loaded;  to activate `.zprofile` we can kill vscode-remote server: 
```sh
pkill -f code-server
```
note that this isn't the official way and may not work on every platform, but it provide a hint for solving this problem.

after restart the code-server, we rerun the previous command
```sh
which swiftly
swiftly --version
```
`swiftly` can't be find, suggesting that `.zprofile` was loaded;

know we uncomment the line in `.zprofile` and repeat the steps before
```sh
nvim ~/.zprofile
pkill -f code-server
```
after vscode remote connection restart, test swiftly installation
```sh
which swiftly
swiftly --version
```

### swiftly usage
(when recording switch to nvim in macOS vscode terminal)
[swiftly](https://swiftlang.github.io/swiftly/)is A Swift toolchain installer and manager, written in Swift.

at this moment, there is no swift toolchain installed, so you can't compile swift code.

swiftly can help you install swift toolchain with a command line interface

#### swiftly list
```sh
swiftly list
```
this command shows installed toolchains and which is currently used. No info currents, as we haven't install any one.
#### install
we first install the lastest release version of swift
```sh
swiftly install latest
```
at the time of recording, the latest stable release is `5.10.1`
after installation, we can now compile swift code.
```sh
swift --version
mkdir Swift61ADemo
cd Swift61ADemo
swift package init --type executable --name Demo
nvim Sources/ # write some code print("Hello, World")
swift run # from nvim command line
# 😋😋
```
can we can install another version, for example current development version
```sh
swiftly 
swiftly install main-snapshot
```
#### switch
after installation, we can switch between different toolchains
```sh
swiftly list
swiftly use ...
swift --version # now we have switch to another 
```

### editor
(hzk windows vscode wsl)
```sh
uname -a
cat /etc/lsb-release
```
you can config nvim to have swiftly autocomplete as I demostrate before.

and I love visual studio code as there are pretty much extensions including swift extension. (use visual studio code, search swift and install extension)
```sh
code Swift61ADemo
```
now you can enjoy coding in swift and have fun with this course
