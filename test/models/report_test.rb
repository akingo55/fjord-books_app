# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'report is editable?' do
    one = reports(:one)
    two = reports(:two)

    alice = users(:alice)
    bob = users(:bob)

    assert one.editable?(alice)
    assert_not one.editable?(bob)

    assert two.editable?(bob)
    assert_not two.editable?(alice)
  end

  test 'format created_on' do
    one = reports(:one)

    travel_to Date.new(2022, 8, 1) do
      assert_equal one.created_on, Date.new(2022, 8, 1)
    end
  end
end
