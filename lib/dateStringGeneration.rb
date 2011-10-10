require "date"

# osascript -e 'tell app "TextMate" to reload bundles'

class DateStringGeneration

  def dateStringForTaskHeading(date)
    weekdayName = Date::DAYNAMES[date.wday]
    "#{weekdayName}, #{date.day}.#{date.month}.:"
  end

  def dateStringsForTaskHeading(dateIntervalString)
      # expects something like "10-10-2011..12-10-2011"
      raise "Wrong format for date string interval: #{dateIntervalString}" unless dateIntervalString.include?("..")
      from, to = dateIntervalString.split("..")
      datePattern = /[0..9]{2}-[0..9]{2}-[0..9]{2,4}/
      raise "Wrong format for from date" if from === datePattern
      raise "Wrong format for to date" if to === datePattern
      fromDate, toDate = Date.parse(from), Date.parse(to)
      (fromDate..toDate).collect {|date| self.dateStringForTaskHeading date}.join("\n\n")
  end

end