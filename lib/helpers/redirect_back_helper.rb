# View helpers for making use of RedirectBack.
#
module RedirectBackHelper
  
  # Creates a link to the most recently stored return point if possible, falls
  # back to the specified URI otherwise.
  #
  # text - The String representing the link text.
  # options - The Object specifying the default URI of the link.
  # html_options - The Hash options used to customize the HTML.
  #
  # Examples
  #
  #   link_back('Back', {:action => 'list'})
  #
  # Returns the HTML link.
  def link_back(text, options, html_options={})
    options = session[:return_to_uri] || options
    link_to(text, options, html_options)
  end
  
  # Creates a button to the most recently stored return point if possible,
  # falls back to the specified URI otherwise.
  #
  # text - The String representing the button text.
  # options - The Object specifying the default URI for the button.
  # html_options - The Hash options used to customize the HTML.
  #
  # Examples
  #
  #   button_back('Cancel', root_url, {:class => 'super_button'})
  #
  # Returns the HTML button.
  def button_back(text, options, html_options={})
    options = session[:return_to_uri] || options
    button_to(text, options, html_options)
  end
  
end

