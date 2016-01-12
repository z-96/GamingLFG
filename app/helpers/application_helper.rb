module ApplicationHelper
  def markdown_to_html(markdown)
     renderer = Redcarpet::Render::HTML.new(filter_html: true)
   end
end
