# -*- encoding: utf-8 -*-
require 'bundler/setup'
require "em-eventsource"

EM.run do
  source = EventMachine::EventSource.new("http://localhost:9292/")
  source.open do
    puts "Open"
  end

  source.message do |message|
    puts message.inspect
  end

  source.error do |error|
    puts "Error: #{error.inspect}"
  end

  source.start
end

