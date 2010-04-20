Sleepy - A misbehaving NIF
==========================

This demonstrates what happens if a NIF takes a long time and is called from
as many schedulers as exist in the VM. Namely, that the VM is halted until the
NIF functions return.
