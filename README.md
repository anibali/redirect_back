redirect_back
=============

Synopsis
--------

This Rails plugin makes it easier to redirect back to actions by storing the
return path in the session.

Usage
-----

Place this in application_controller.rb:

    include RedirectBack
    
Then, in a controller:

    before_filter :store_return_point, :only => [:list]

    def list
    end

    def edit
      # ...
      redirect_back :action => "list"
    end

If redirect_back is accessed through an action which utilizes
`store_return_point`, it will use the path stored in the session to redirect to.
Otherwise it will use the arguments passed to it to determine the URI.

`link_back` can be used in views in a similar way:

    <%= link_back "Back", :action => "list" %>

