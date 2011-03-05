# # http://aflatter.de/2010/06/testing-headers-and-ssl-with-cucumber-and-capybara/
# # The following solution will work only if you use the :rack_test driver.
# module RackTestMixin
#
#   def self.included(mod)
#     mod.class_eval do
#       # This is where we save additional entries.
#       def hacked_env
#         @hacked_env ||= {}
#       end
#
#       # Alias the original method for further use.
#       alias_method  :original_env, :env
#
#       # Override the method to merge additional headers.
#       # Plus this implicitly makes it public.
#       def env
#         original_env.merge(hacked_env)
#       end
#     end
#   end
#
# end
#
# Capybara::Driver::RackTest.send :include, RackTestMixin
#
# module HeadersHackHelper
#
#   def add_headers(headers)
#     page.driver.hacked_env.merge!(headers)
#   end
#
# end
#
# World(HeadersHackHelper)

module RackHeaderHack
  def set_headers(headers)
    driver = page.driver
    def driver.env
      @env.merge(super)
    end
    def driver.env=(env)
      @env = env
    end
    driver.env = headers
  end
end
World(RackHeaderHack)