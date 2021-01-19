module Formattable
    def html
        if try(:information)
            information.gsub(/[\n\r]+/,'<br/><br/>').html_safe
        else
            bio.gsub(/[\n\r]+/,'<br/><br/>').html_safe
        end
    end
end