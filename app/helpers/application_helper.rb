module ApplicationHelper
  def title(title, heading: title)
    content_for(:page_title, title)
    content_for(:page_heading, heading)
  end

  def breadcrumb(text, path)
    content_for(:breadcrumb) do
      link_to(path, class: "flex items-center text-sm font-medium text-gray-500 hover:text-gray-700 dark:text-slate-500 dark:hover:text-slate-400") do
        content_tag(:span, chevron_left) + content_tag(:span, text)
      end
    end
  end

  def chevron_left
    content_tag(:svg, xlmns: "http://www.w3.org/2000/svg", viewBox: "0 0 20 20", fill: "currentColor", class: "w-5 h-5") do
      content_tag(:path, nil,
        "fill-rule": "evenodd",
        d: "M12.79 5.23a.75.75 0 01-.02 1.06L8.832 10l3.938 3.71a.75.75 0 11-1.04 1.08l-4.5-4.25a.75.75 0 010-1.08l4.5-4.25a.75.75 0 011.06.02z",
        "clip-rule": "evenodd")
    end
  end
end
