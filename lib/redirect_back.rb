require 'helpers/redirect_back_helper'

# Various methods which enable easier management of return points.
# It is intended that RedirectBack be included in the ApplicationController of
# a Rails application.
#
# Original idea from http://ethilien.net/archives/better-redirects-in-rails/
# and it's comments.
#
module RedirectBack

  # Stores the current URI as a return point. It is usually handy to attach this
  # method to a before_filter in controllers.
  #
  # Examples
  #
  #   before_filter :store_return_point, :only => 'show'
  #
  # Returns nothing.
  def store_return_point
    session[:return_to_uri] = request.fullpath
  end
  
  # Deletes the current return point.
  #
  # Returns the deleted return point's URI.
  def delete_return_point
    session.delete :return_to_uri
  end

  # Redirects to the most recently stored return point if possible, falls back
  # to the specified URI otherwise. This method also deletes the return point
  # from storage.
  #
  # *args - The Object specifying the default URI to redirect to.
  #
  # Returns nothing.
  def redirect_back(*args)
    uri = session[:return_to_uri]
    delete_return_point
    uri ? redirect_to(uri) : redirect_to(*args)
  end

  # Stores the current URI as a return point and redirects to the specified URI.
  #
  # *args - The Object specifying arguments to send to redirect_to.
  #
  # Returns nothing.
  def redirect_away(*args)
    store_return_point
    redirect_to(*args)
  end
  
end

