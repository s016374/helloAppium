# android/spec/regression_spec.rb
require 'rspec'

RSpec.describe 'try ios' do
  it 'try case' do
    text('Buttons').click
    back
  end
end
