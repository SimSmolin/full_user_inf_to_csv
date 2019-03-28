require 'redmine'
require_relative 'lib/query_patch'
require_relative 'lib/time_entry_query_patch'

# ActionDispatch::Callbacks.to_prepare do                for Rails 5.0 -- deprecoted TODO sim need testing
# ActiveSupport::Reloader.to_prepare do                  for Rails 5.1
reloader = defined?(ActiveSupport::Reloader) ? ActiveSupport::Reloader : ActionDispatch::Reloader
reloader.to_prepare do
  QueryCustomFieldColumn.send :include, QueryCustomFieldColumnPatch
end

reloader.to_prepare do
  TimeEntryQuery.send :include, TimeEntryQueryPatch
end

Redmine::Plugin.register :full_user_inf_to_csv do
  name 'Full User information upload to .csv plugin'
  author 'Sergey Melnikov'
  description 'This is a plugin for Redmine. Added users custom fields to time_entry report'
  version '0.0.3'
  url 'https://github.com/SimSmolin/full_user_inf_to_csv.git'
  author_url 'https://github.com/SimSmolin'
end
