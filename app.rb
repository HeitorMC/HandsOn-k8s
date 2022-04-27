# frozen_string_literal: true

require 'sinatra'
require 'socket'

get '/' do
  erb :k8s
end
