require 'redirect_back'

ActionView::Base.class_eval do
  include RedirectBackHelper
end

