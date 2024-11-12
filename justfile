default:
  just --list

run year day *args:
  @stack run year{{year}}-day{{day}} -- {{args}}

runp year day part:
  @stack run year{{year}}-day{{day}} -- --part {{part}}

repl year day:
  @stack repl multiple-executables-example:exe:year{{year}}-day{{day}}
