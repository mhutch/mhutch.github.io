module Jekyll
    module SiteFixup
      def tag_name_fixup(name)
        case name
        when 'csharp'
          'c#'
        when 'gtksharp'
          'gtk#'
        when 'jscallsharp'
          'jscall#'
        when 'cplusplus'
          'c++'
        else
          name
        end
      end
    end
  end

  Liquid::Template.register_filter(Jekyll::SiteFixup)