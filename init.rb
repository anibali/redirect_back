require 'redirect_back'
require 'action_view'

ActionView::Base.class_eval do
  include RedirectBackHelper
end

