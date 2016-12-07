module PracticesHelper
  def minutes_to_hours(min)
    hours = min / 60
    if hours > 0
      "#{hours} hour(s) and #{min%60} minute(s)"
    else
      "#{min} minutes"
    end
  end
end
