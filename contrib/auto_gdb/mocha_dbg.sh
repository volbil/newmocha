#!/bin/bash
# use testnet settings,  if you need mainnet,  use ~/.mochacore/mochad.pid file instead
mocha_pid=$(<~/.mochacore/testnet3/mochad.pid)
sudo gdb -batch -ex "source debug.gdb" mochad ${mocha_pid}
