#!/usr/bin/env ruby

#
# AWS_SECRET_ACCESS_KEY=VsVngY...
# AWS_DEFAULT_PROFILE=pburkholder
# AWS_REGION=us-east-1
# AWS_ACCESS_KEY_ID=AKIAJ...
# AWS_ACCESS_KEY=AKIAJ...
# AWS_SECRET_KEY=VsVn....
#
require 'inspec/aws'

#ENV['vpc_id'] = 'vpc-e81ba68f'

  puts "Running Inspec on example profile..."
  o = {}
  o[:log_format] = 'json'
  o[:logger] = Logger.new(STDOUT)
  o[:logger].level = 'debug'
  o[:ignore_supports] = true

  runner = Inspec::Runner.new(o)
  profile = Inspec::Profile.for_target('./profile',{})
  runner.add_profile(profile)
  runner.run
  print JSON.pretty_generate(runner.report)
