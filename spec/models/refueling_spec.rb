require 'spec_helper'

describe Refueling do
  it { should validate_presence_of(:mileage) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:liter) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:car) }

end
