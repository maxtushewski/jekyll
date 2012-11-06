puts "kramdown_html_pyments"
require 'kramdown'
# puts "kramdown_html_pyments.2"

module Kramdown
    # puts "kramdown_html_pyments.3"
    module Converter
        class Htmlc < Html
            def convert_codeblock(el, indent)
                puts "convert_codeblock"
                # attr = el.attr.dup
                # lang = extract_code_language!(attr)
                puts "Lang        : #{lang}"
                puts "Default lang: #{@options}"
                "<pre><code>WORKS</code></pre>"
                # puts "Linenos     : #{@options[:pygments_default_linenos]}"
                # if lang || @options[:pygments_default_lang]
                #     lang = (lang || @options[:pygments_default_lang]).to_sym
                #     result = Pygments.highlight(el.value, :lexer => lang, :options => { :encoding => 'utf-8' , :linenos => @options[:pygments_default_linenos]})
                #     "#{' '*indent}#{result}\n"
                # else
                #   result = escape_html(el.value)
                #   result.chomp!
                #   if el.attr['class'].to_s =~ /\bshow-whitespaces\b/
                #     result.gsub!(/(?:(^[ \t]+)|([ \t]+$)|([ \t]+))/) do |m|
                #       suffix = ($1 ? '-l' : ($2 ? '-r' : ''))
                #       m.scan(/./).map do |c|
                #         case c
                #         when "\t" then "<span class=\"ws-tab#{suffix}\">\t</span>"
                #         when " " then "<span class=\"ws-space#{suffix}\">&#8901;</span>"
                #         end
                #       end.join('')
                #     end
                #   end
                #   code_attr = {}
                #   code_attr['class'] = "language-#{lang}" if lang
                #   "#{' '*indent}<pre#{html_attributes(attr)}><code#{html_attributes(code_attr)}>#{result}\n</code></pre>\n"
                # end
            end
        end
    end

    module Converter
      autoload :Htmlc, 'jekyll/converters/kramdown_html_pygments'
    end

    puts "kramdown_html_pyments.5"
end

puts "kramdown_html_pyments.6"

