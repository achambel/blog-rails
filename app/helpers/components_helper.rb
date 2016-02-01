module ComponentsHelper
  def grid_for(lst, options = {})
    return  content_tag :div,
            t('views.defaults.no_results'),
            class: 'ui message' if lst.length.zero?

      defaults = {
        columns: [],
        exclude: [],
        class: 'ui selectable striped table',
        actions: true
      }

      model = lst.first.class

      options = defaults.merge!(options)

      if options[:columns].length > 0
        attrs = options[:columns] - options[:exclude]
      else
        attrs = model.column_names.map(&:to_sym) - options[:exclude]
      end

      content_tag :table, class: options[:class] do
        concat(header(model, attrs, options))

        lst.each do |obj|
          concat(row(obj, attrs, options))
        end
      end
  end

  def button_to(text, url, options = {})
    defaults = { class: 'ui teal button', icon: nil }
    options = defaults.merge!(options)

    link_to url,
            class: options[:class] do
      concat content_tag(:i, nil, class: "#{options[:icon]} icon")
      concat text
    end
  end

private
  def header(model, attrs, options)
    content_tag :thead do
      content_tag :tr do
        attrs.each do |col|
          concat(content_tag :th, model.human_attribute_name(col))
        end
        concat(content_tag :th, t('views.defaults.actions')) if options[:actions] == true
      end
    end
  end

  def row(obj, attrs, options)
    content_tag :tr do
      attrs.each do |col|
        concat(content_tag :td, obj[col])
      end
      concat(content_tag :td, render('partials/dropdown_actions', object: obj)) if options[:actions] == true
    end
  end
end
