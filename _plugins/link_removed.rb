module Jekyll
    class FileLinkRemovedTag < Liquid::Tag

      def initialize(tag_name, text, tokens)
        super
        @url=text.split(" ")[0]
        start = @url.length + 1
        @link_text=text[start..text.length]
      end

      def render(context)
        "<a href='#' title='#{@url}'>#{@link_text}</a><em>(UPDATE: file removed)</em>"
      end
    end
  end

  Liquid::Template.register_tag('file_link_removed', Jekyll::FileLinkRemovedTag)