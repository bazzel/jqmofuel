require 'spec_helper'

describe Car do
  it { should validate_presence_of(:brand) }
  # it { should have_any(:refeulings) }
end
