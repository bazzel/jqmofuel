module JqueryMobileHelper

  # = jqm_header do
  #   %h1 Page Title
  #
  # will output:
  #   <div data-role="header">
  #       <h1>Page Title</h1>
  #   </div>
  def jqm_header(options = {}, &block)
    default_options = {
      :'data-role' => "header"
    }

    content_tag(:div, default_options.merge(options), &block)
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

  def jqm_footer(active = nil)

    html_options = {
      :'data-ajax' => false
    }

    # :class => "ui-btn-active", :'data-ajax' => false

    list_items = content_tag(:li, link_to('Refueling', new_refueling_path, link_to_footer_options(active == :refueling)))
    list_items << content_tag(:li, link_to('Cars', cars_path, link_to_footer_options(active == :cars)))
    list_items << content_tag(:li, link_to('My Info', edit_user_registration_path, link_to_footer_options(active == :my_info)))

    content_tag(:div, { :'data-role' => 'footer', :'data-position' => "fixed" }) do
      content_tag(:div, { :'data-role' => 'navbar' }) do
        content_tag(:ul, list_items)
      end
    end
  end

  private
  def link_to_footer_options(active)
    options = {
      :'data-ajax' => false
    }

    options[:class] = 'ui-btn-active' if active

    options
  end
end
