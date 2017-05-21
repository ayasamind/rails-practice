module ApplicationHelper
    def page_title
        title = 'いとしま子ども起業家塾'
        title = @page_title + "-"+ title if @page_title
        title
end

    def menu_link_to(text, path)
            link_to_unless_current(text, path){content_tag(:span, text) }
        end
end
