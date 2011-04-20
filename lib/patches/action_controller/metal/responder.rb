module ActionController
  class Responder
    # We want to make our :mobile format respond the same to respond_with as :html
    alias :to_mobile :to_html
  end
end
