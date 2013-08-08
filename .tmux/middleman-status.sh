#!/usr/bin/env ruby 
# coding: utf-8

ps_result = `ps aux | grep middleman`
if /\/bin\/middleman/ =~ ps_result
  print " MM "
end
