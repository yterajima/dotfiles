#!/usr/bin/env ruby
ps_result = `ps aux | grep gocode | grep -v 'grep' | grep -v 'gocode-status'`
if /gocode/ =~ ps_result
  print " GoCode "
end
