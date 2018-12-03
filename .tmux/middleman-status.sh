#!/usr/bin/env ruby
ps_result = `ps aux | grep middleman`
if /\/bin\/middleman/ =~ ps_result
  if /\/wiki\// =~ ps_result
    print " MW "
  else
    print " MM "
  end
end
