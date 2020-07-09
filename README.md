# Fortran_GDB_Common
A repo demonstrating a problem where GDB can't seem to examine the value of Fortran common module variables

# With this line active:

(in somemodule.f90)

```f90
common /othermodule/  moduleVar
```

```sh
$ nm somemodule.o
0000000000000008 C othermodule_

$ gdb main
GNU gdb (Ubuntu 9.1-0ubuntu1) 9.1
Copyright (C) 2020 Free Software Foundation, Inc.
(...)
Reading symbols from main...
(gdb) b 9
Breakpoint 1 at 0x1238: file main.f90, line 9.
(gdb) r
Starting program: /home/me/a_dev/fortran_gdb_common/main 
moduleVar=123

Breakpoint 1, myprogram () at main.f90:9
9	end program
(gdb) call moduleVar
No symbol "moduleVar" in current context.
(gdb) call (int8_t) othermodule_
$1 = 123

```

# With that line commented out:
```f90
!common /othermodule/  moduleVar
```
```sh
$ nm somemodule.o
0000000000000000 B __somemodule_MOD_modulevar

$ gdb main
GNU gdb (Ubuntu 9.1-0ubuntu1) 9.1
Copyright (C) 2020 Free Software Foundation, Inc.
(...)
Reading symbols from main...
(gdb) b 9
Breakpoint 1 at 0x1238: file main.f90, line 9.
(gdb) r
Starting program: /home/me/a_dev/fortran_gdb_common/main 
moduleVar=123

Breakpoint 1, myprogram () at main.f90:9
9	end program
(gdb) call moduleVar
$1 = 123

```
