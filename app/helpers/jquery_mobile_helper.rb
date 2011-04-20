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
    list_items = content_tag(:li, link_to_refueling(active))
    list_items << content_tag(:li, link_to_cars(active))
    list_items << content_tag(:li, link_to_my_info(active))

    content_tag(:div, { :'data-role' => 'footer', :'data-position' => "fixed" }) do
      content_tag(:div, { :'data-role' => 'navbar' }) do
        content_tag(:ul, list_items)
      end
    end
  end

  # = navigation_buttons('http://example.com')
  #
  # will output:
  # <div class="chart-navigation" data-role="controlgroup" data-type="horizontal">
  #   <a href="#" data-icon="arrow-l" data-rel="back" data-role="button">Vorige</a>
  #   <a href="http://example.com" data-icon="arrow-r" data-iconpos="right" data-role="button">Volgende</a>
  # </div>
  def navigation_buttons(next_url)
    options = {
      :'data-role' => "controlgroup",
      :'data-type' => "horizontal",
      :class       => "chart-navigation"
    }
    content_tag(:div, link_to_previous + link_to_next(next_url), options)
  end

  private
  def link_to_previous
    body = t('buttons.previous')
    url = '#'
    html_options = {
      :'data-role' => "button",
      :'data-icon' => "arrow-l",
      :'data-rel'  => "back"
    }
    link_to(body, url, html_options)
  end

  def link_to_next(next_url)
    body = t('buttons.next')
    url = next_url
    html_options = {
      :'data-role'    => "button",
      :'data-icon'    => "arrow-r",
      :'data-iconpos' => "right"
    }
    link_to(body, url, html_options)
  end

  def link_to_refueling(active)
    body = t('footer.refueling')
    url = new_refueling_path
    html_options = link_to_footer_options(active == :refueling).merge(:id => 'refueling')
    link_to(body, url, html_options)
  end

  def link_to_cars(active)
    body = t('footer.cars')
    url = cars_path
    html_options = link_to_footer_options(active == :cars).merge(:id => 'cars')
    link_to(body, url, html_options)
  end

  def link_to_my_info(active)
    body = t('footer.my-info')
    url = edit_user_registration_path
    html_options = link_to_footer_options(active == :my_info).merge(:id => 'my-info')
    link_to(body, url, html_options)
  end

  def link_to_footer_options(active)
    options = {
      :'data-ajax' => false,
      :'data-icon' => 'custom'
    }

    options[:class] = 'ui-btn-active' if active

    options
  end
end