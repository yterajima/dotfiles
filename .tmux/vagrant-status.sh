#!/usr/bin/env ruby
ps_result = `ps aux | grep Headless`
if /(VBoxHeadless|VBoxNetDHCP)/ =~ ps_result
  print " V "
end

