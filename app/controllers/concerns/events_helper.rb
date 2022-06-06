module EventsHelper

  def compute_clothes(min_temp, max_temp)
    if min_temp <= 5 && max_temp <= 10
      'Wear warm clothes'
    elsif min_temp <= 10 && max_temp <= 15
      'Wear a jacket and a thick sweater'
    elsif min_temp <= 10 && max_temp >= 15
      'Wear a jacket and a light sweater'
    elsif min_temp >= 10 && max_temp <= 20
      'Take a sweater'
    elsif min_temp <= 20 && max_temp >= 20
      'Wear light clothes and maybe a sweater'
    elsif min_temp >= 20 && max_temp >= 20
      'Wear light clothes'
    end
  end

end
