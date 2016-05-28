require 'spec_helper'

RSpec.describe Dummy do
  it { expect{Dummy.new.disp}.not_to raise_error }
end
