require File.expand_path('../../test_helper', __FILE__)

require 'mocha/multiple_yields'

class MultipleYieldsTest < Mocha::TestCase
  include Mocha

  def test_should_provide_parameters_for_no_yields_in_single_invocation
    parameter_group = MultipleYields.new
    parameter_groups = []
    parameter_group.each do |parameters|
      parameter_groups << parameters
    end
    assert_equal [], parameter_groups
  end

  def test_should_provide_parameters_for_single_yield_in_single_invocation
    parameter_group = MultipleYields.new([1, 2, 3])
    parameter_groups = []
    parameter_group.each do |parameters|
      parameter_groups << parameters
    end
    assert_equal [[1, 2, 3]], parameter_groups
  end

  def test_should_provide_parameters_for_multiple_yields_in_single_invocation
    parameter_group = MultipleYields.new([1, 2, 3], [4, 5])
    parameter_groups = []
    parameter_group.each do |parameters|
      parameter_groups << parameters
    end
    assert_equal [[1, 2, 3], [4, 5]], parameter_groups
  end
end
