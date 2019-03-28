require_dependency 'queries_helper'

module QueriesHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      unloadable
      alias_method :query_to_csv, :query_to_csv_patch # method "query_to_csv" was modify
    end
  end

  module InstanceMethods

    def query_to_csv_patch(items, query, options={})
      columns = query.columns

      Redmine::Export::CSV.generate do |csv|
        if items.first.is_a?(TimeEntry)
          # csv header fields
          temp_csv = columns.map {|c| c.caption.to_s}
          csv << temp_csv + User.current.visible_custom_field_values.collect { |c| l(:field_user)+':'+c.custom_field.name }
          # csv lines
          items.each do |item|
            temp_csv = columns.map {|c| csv_content(c, item)}
            csv << temp_csv + item.user.custom_field_values.collect { |v| v.value }
          end
        else
          # csv header fields
          csv << columns.map {|c| c.caption.to_s}
          # csv lines
          items.each do |item|
            csv << columns.map {|c| csv_content(c, item)}
          end
        end
      end
    end
  end
end