#!/usr/bin/env ruby
# coding: utf-8

ps_result = `ps aux | grep rails`
if /bin\/rails/ =~ ps_result
  print " RoR "
end

