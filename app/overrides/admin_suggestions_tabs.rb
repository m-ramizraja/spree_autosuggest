Deface::Override.new(virtual_path:  "spree/layouts/admin",
                     name:          "suggestions_admin_tabs",
                     insert_bottom: "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     text:          "<%= tab(:suggestions, url: spree.admin_suggestions_path) %>",
                     disabled:      false)
