# Ruby Design Patters / Template method
class Report
    def make
        header
        footer
        footer_double
        body
    end
    
    def header
        raise NoImplementedError
    end
    
    def footer_double
    end
end

class HtmlReport < Report
    def header
        puts "html header"
    end
    
    def body
        puts "bu"
    end
    def footer
        puts "footer"
    end
    
    def footer_double
        puts 'bdo42423'
    end
end

class PlainReport <Report

    def header
    puts "hhhhdfsdfs"
    end
    
    def body
        puts "busdfsdfsdfs"
    end
    def footer
        puts "dfdfsdfsdfsdfsdf"
    end
end
    