module ApplicationHelper
    
include Rails.application.routes.url_helpers

    def cancel_link
      return link_to 'Cancel', movies_path, 
        :class => 'cancel', 
        :confirm => 'Are you sure? Any changes will be lost.'
    end
    
end
