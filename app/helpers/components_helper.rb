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

      opts = defaults.merge!(options)

      if opts[:columns].length > 0
        attrs = extract_columns(opts[:columns]) - opts[:exclude]
      else
        attrs = model.column_names.map(&:to_sym) - opts[:exclude]
      end

      content_tag :table, class: opts[:class] do
        concat(header(model, attrs, opts))

        lst.each do |obj|
          concat(row(obj, attrs, opts))
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
  def extract_columns(cols)
    columns = []

    cols.each do |column|
      if column.is_a? Hash
        columns << column.keys.first
      elsif column.is_a? Symbol
        columns << column
      end

    end
      columns
  end

  def header(model, cols, options)
    content_tag :thead do
      content_tag :tr do
        cols.each do |col|
          concat(content_tag :th, model.human_attribute_name(col))
        end
        concat(content_tag :th, t('views.defaults.actions')) if options[:actions] == true
      end
    end
  end

  def row(obj, cols, options)
    content_tag :tr do
      cols.each do |col|
        concat(content_tag :td, data_link(obj, col, options[:columns]))
      end
      concat(content_tag :td, render('partials/dropdown_actions', object: obj)) if options[:actions] == true
    end
  end

  def data_link(obj, colum_name, options)
    options.each do |opt|
      if opt.is_a? Hash
        if opt.keys[0] == colum_name
          data_for = opt.values[0]
          return link_to obj[colum_name], send("#{obj.class.name.downcase}_#{data_for}_path", obj)
        end
      else
        return obj[colum_name]
      end
    end
  end
end
