require 'spec_helper'

describe User do
  it { should have_many(:cars, :dependent => :destroy) }
  it { should have_many(:refuelings) }

end
