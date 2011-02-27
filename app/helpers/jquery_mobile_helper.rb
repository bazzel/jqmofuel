module JqueryMobileHelper

  # = jqm_header do
  #   %h1 Page Title
  #
  # will output:
  #   <div data-role="header">
  #       <h1>Page Title</h1>
  #   </div>
  def jqm_header(&block)
    content_tag(:div, :'data-role' => "header", &block)
  end

  # = jqm_content do
  #   %p Page content goes here.
  #
  # will output:
  #   <div data-role="content">
  #       <p>Page content goes here.</p>
  #   </div>
  def jqm_content(&block)
    content_tag(:div, :'data-role' => "content", &block)
  end
end