module TrimFilter
    def strip_prefix(input,prefix)
      input.delete_prefix(prefix)
    end
    def strip_suffix(input,suffix)
      input.delete_suffix(suffix)
    end
    def strip_tag(input,tag)
        input.strip.delete_prefix('<'+tag+'>').delete_suffix('</'+tag+'>')
    end
    Liquid::Template.register_filter self
  end