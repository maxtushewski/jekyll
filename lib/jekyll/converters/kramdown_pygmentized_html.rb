puts "kramdown_html_pyments"
require 'kramdown'
require 'pygments'

module Kramdown
    # puts "kramdown_html_pyments.3"
    module Converter
        class PygmentizedHtml < Html
            def convert_codeblock(el, indent)
                attr = el.attr.dup
                lang = extract_code_language!(attr)
                puts "Lang        : #{lang}"
                if lang
                    puts "            : convert_codeblock : #{el.value}"
                    puts " :linenos       => #{@options[:coderay_line_numbers]}"
                    puts " :linenostart   => #{@options[:coderay_line_number_start]},"
                    puts " :linenospecial => #{@options[:coderay_bold_every]},"
                    puts " :cssclass      => #{@options[:coderay_css]}"
                    result = Pygments.highlight(el.value, 
                        :lexer => lang.to_sym, 
                        :options => { :encoding      => 'utf-8',
                                      :linenos       => @options[:coderay_line_numbers],
                                      :linenostart   => @options[:coderay_line_number_start],
                                      :linenospecial => @options[:coderay_bold_every],
                                      :cssclass      => @options[:coderay_css]})
                    puts "Pygments:\n #{result}"
                    "#{' '*indent}#{result}\n"
                else
                    puts "            : convert_codeblock : NO LANG"                    
                    super(el, indent)
                end
            end
        end
    end

 #  || false,
end
