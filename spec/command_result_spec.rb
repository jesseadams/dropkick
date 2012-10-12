require 'minitest/autorun'
require './spec/spec_helper'

describe CommandResult do
  before do
    @result = CommandResult.new('output', 'error', 0, 0.1) 
  end

  it 'must create a proper result class' do
    @result.stdout.must_equal 'output'
    @result.stderr.must_equal 'error'
    @result.successful?.must_equal true
    @result.duration.must_equal 0.1
  end
  
  it 'must recognize failures' do
    [1, 10, 1000].each do |exit_code|
      result = CommandResult.new('output', 'error', exit_code, 0.1)
      result.successful?.must_equal false
    end
  end

  it 'must display output' do
    @result.output.must_equal 'output'
  end
  
  it 'must display errors' do
    @result.errors.must_equal 'error'
  end
end
