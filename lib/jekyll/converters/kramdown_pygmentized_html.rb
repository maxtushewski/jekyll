require 'kramdown'
require 'pygments'

module Kramdown
    module Converter
        class PygmentizedHtml < Html
            def convert_codeblock(el, indent)
                attr = el.attr.dup
                lang = extract_code_language!(attr)
                if lang
                    result = Pygments.highlight(el.value, 
                        :lexer => lang.to_sym, 
                        :options => { :encoding      => 'utf-8',
                                      :linenos       => @options[:coderay_line_numbers] || false,
                                      :linenostart   => @options[:coderay_line_number_start],
                                      :linenospecial => @options[:coderay_bold_every],
                                      :cssclass      => @options[:coderay_css]})
                    "#{' '*indent}#{result}\n"
                else
                    super(el, indent)
                end
            end
        end
    end
end