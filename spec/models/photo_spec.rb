
require 'rails_helper'

describe Photo  do
  it { should validate_presence_of :title }
end
