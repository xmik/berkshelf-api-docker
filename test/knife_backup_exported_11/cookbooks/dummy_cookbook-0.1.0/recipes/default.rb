#
# Cookbook Name:: dummy_cookbook
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
file '/usr/bin/hello' do
  content '#!/bin/bash \n\necho hello\n'
end
