#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Cookbook:: iis
# Recipe:: mod_application_initialization
#
# Copyright:: 2011-2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'iis'

if Opscode::IIS::Helper.older_than_windows2008r2?
  log 'Application Initialization module is not supported on Windows 2008 or lower, ignoring'
else
  windows_feature 'IIS-ApplicationInit' do
    action :install
  end
end
