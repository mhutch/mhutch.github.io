module Jekyll
    module PowerFilter
      def power(num,pow)
        num ** pow
      end
      def log(num,base)
        Math.log(num,base)
      end
      def max(a,b)
        a > b ? a : b
      end
    end
  end

  Liquid::Template.register_filter(Jekyll::PowerFilter)