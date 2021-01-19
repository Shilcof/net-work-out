module Formattable
    def html
        if try(:information)
            information.gsub("\r\n\r\n","<br><br>")
        else
            bio.gsub("\r\n\r\n","<br><br>")
        end
    end
end