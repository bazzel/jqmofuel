# https://github.com/svenfuchs/i18n/wiki/Fallbacks
require "i18n/backend/fallbacks"
I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)