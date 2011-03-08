module ApplicationHelper

  def locale_selection
    existing_locale_names = I18n.available_locales.map(&:to_s)

    pairs = Locale::MAPPING.to_a.map(&:reverse).sort_by(&:first)
    pairs.select {|pair| existing_locale_names.include?(pair.last) }
  end
end
