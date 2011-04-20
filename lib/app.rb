class App

  class << self
    def name
      'e-fueling'
    end

    def host
      APP_CONFIG["host"]
    end
  end
end