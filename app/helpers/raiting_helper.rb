module RaitingHelper
  def average_raiting (rate)
    if rate == nil
      rate = 0
    else
      rate.round(2)
    end
  end
end
