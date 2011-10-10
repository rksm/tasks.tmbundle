require "test/unit"

require "dateStringGeneration"

class TestDateStringGeneration < Test::Unit::TestCase
  
  def setup
    @sut = DateStringGeneration.new
  end
  
  def testDateStringForTaskHeading
    date = Date.parse("10-10-2011")
    assert_equal("Monday, 10.10.:", @sut.dateStringForTaskHeading(date))
  end
  
  def testMultipleDateStringsForTimeInterval
    expected = "Monday, 10.10.:\n\nTuesday, 11.10.:\n\nWednesday, 12.10.:"
    assert_equal(expected, @sut.dateStringsForTaskHeading("10-10-2011..12-10-2011"))
  end
  
  def testDateStringCanIncludeSpaces
    expected = "Monday, 10.10.:\n\nTuesday, 11.10.:"
    assert_equal(expected, @sut.dateStringsForTaskHeading("    10-10-2011..  11-10-2011  "))
  end
  
  def testWrongDateRaisesException
    assert_raise(ArgumentError) { @sut.dateStringsForTaskHeading("01-01-2001..bar") }
  end
  
end