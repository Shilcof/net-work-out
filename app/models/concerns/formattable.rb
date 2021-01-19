module Formattable
    def html
        if try(:information)
            information.gsub(/\n/,'<br/>').html_safe
        else
            bio.gsub(/\n/,'<br/>').html_safe
        end
    end
end