require "date"

class HolidaySchedule
  def self.build(holidays_csv_string)
    begin
      holiday_strings = holidays_csv_string.strip.delete(" ").split("\n")
      holidays = holiday_strings.map do |hs|
        Holiday.new *hs.split(",")
      end
      new(holidays)
    rescue
      new([])
    end
  end

  attr_reader :holidays

  def initialize(holidays = [])
    @holidays = holidays
  end

  def upcoming(time_period = 1.month)
    holidays.sort_by(&:start_date).select do |holiday|
      holiday.end_date >= Date.today && holiday.start_date <= time_period.from_now
    end
  end

  class Holiday
    attr_reader :start_date, :end_date

    def initialize(start_date, end_date = start_date)
      @start_date = DateTime.parse(start_date)
      @end_date   = DateTime.parse(end_date)
    end

    def to_s
      if single_day?
        start_date_format
      else
        "#{start_date_format} - #{end_date_format}"
      end
    end

    private

    def single_day?
      start_date == end_date
    end

    def start_date_format
      start_date.strftime("%B #{start_date.day.ordinalize}")
    end

    def end_date_format
      if end_date.month == start_date.month
        end_date.day.ordinalize
      else
        end_date.strftime("%B #{end_date.day.ordinalize}")
      end
    end
  end
end
