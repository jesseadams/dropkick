## DropKick ##

A simple gem for a simpe job: securely executing commands as cleanly as possible. This could seen as a wrapper to Open3#popen3.

### Requirements ###

* >= Ruby 1.9.3

### Installation ###

`gem install dropkick`

### Usage ###

```
1.9.3-p194 :002 > require 'rubygems'
 => true 
1.9.3-p194 :003 > require 'dropkick'
 => true 
1.9.3-p194 :004 > Command.secure_exec('uptime')
 => #<CommandResult:0x007f903c0f5bf8 @stdout="17:18  up  6:40, 2 users, load averages: 1.00 1.03 0.92\n", @stderr="", @exit_code=0, @duration=0.004596> 
1.9.3-p194 :005 > Command.secure_exec('ls', ['-al', '/foo'])
 => #<CommandResult:0x007f903d88c258 @stdout="total 0\ndrwxr-xr-x   4 root  wheel   136 Oct 12 17:16 .\ndrwxr-xr-x  32 root  wheel  1156 Oct 12 17:16 ..\n-rw-r--r--   1 root  wheel     0 Oct 12 17:16 bar\n-rw-r--r--   1 root  wheel     0 Oct 12 17:16 baz\n", @stderr="", @exit_code=0, @duration=0.005816> 
1.9.3-p194 :006 > result = Command.secure_exec('ls', ['-al', '/foo'])
 => #<CommandResult:0x007f903d895628 @stdout="total 0\ndrwxr-xr-x   4 root  wheel   136 Oct 12 17:16 .\ndrwxr-xr-x  32 root  wheel  1156 Oct 12 17:16 ..\n-rw-r--r--   1 root  wheel     0 Oct 12 17:16 bar\n-rw-r--r--   1 root  wheel     0 Oct 12 17:16 baz\n", @stderr="", @exit_code=0, @duration=0.00592> 
1.9.3-p194 :007 > result.output
 => "total 0\ndrwxr-xr-x   4 root  wheel   136 Oct 12 17:16 .\ndrwxr-xr-x  32 root  wheel  1156 Oct 12 17:16 ..\n-rw-r--r--   1 root  wheel     0 Oct 12 17:16 bar\n-rw-r--r--   1 root  wheel     0 Oct 12 17:16 baz\n" 
1.9.3-p194 :008 > puts result.output
total 0
drwxr-xr-x   4 root  wheel   136 Oct 12 17:16 .
drwxr-xr-x  32 root  wheel  1156 Oct 12 17:16 ..
-rw-r--r--   1 root  wheel     0 Oct 12 17:16 bar
-rw-r--r--   1 root  wheel     0 Oct 12 17:16 baz
 => nil 
1.9.3-p194 :009 > puts result.errors

 => nil 
1.9.3-p194 :011 > puts result.successful?
true
 => nil 
1.9.3-p194 :012 > puts result.duration
0.00592
```

### License ###

LGPLv3
