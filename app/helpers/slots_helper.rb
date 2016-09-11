module SlotsHelper
  
  def time_remaining(practice)
    practice.length - (practice.slots.collect { |p| p.length}.inject('+'))
  end
  
end
