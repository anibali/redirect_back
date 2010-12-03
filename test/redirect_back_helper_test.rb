require 'test_helper'

class RedirectBackHelperTest < ActiveSupport::TestCase
  test "link back method present" do
    assert ActionView::Base.new.respond_to? 'link_back'
  end
  
  test "button back method present" do
    assert ActionView::Base.new.respond_to? 'button_back'
  end
end

