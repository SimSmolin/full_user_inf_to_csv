# Redmine TimeEntry(timelog) CustomField addons plugin 

This is Redmine plugin to add one feature. Added users custom fields to time_entry .csv report.

## Installing a plugin

1. Copy your plugin directory into #{RAILS_ROOT}/plugins (Redmine 3.x or 4.x) 
   * If you are downloading the plugin directly from GitHub, you can do so by changing into your plugin directory and issuing a command like 

    ```
    git clone https://github.com/SimSmolin/full_user_inf_to_csv.git
    ```
    For uninstall simple delete directory ```full_user_inf_to_csv``` into #{RAILS_ROOT}/plugins 

    ####NOTE: 
   
        - the plugin has been tested on Redmine 3.4.4 - 3.4.8
        - the plugin has been tested on Redmine 4.0.1 

2. Restart Redmine

You should now be able to see the plugin list in Administration -> Plugins and configure the newly installed plugin.

Now you shold be able to see user custom fields in .csv report  


