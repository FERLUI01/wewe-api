module EventsHelper

  def compute_clothes(min_temp, max_temp)
    if min_temp < 10 && max_temp < 10
      'Wear warm clothes'
    elsif min_temp <= 10 && max_temp <= 15
      'Wear a jacket and a thick sweater'
    elsif min_temp < 20 && max_temp < 20
      'Wear a jacket and a light sweater'
    elsif min_temp < 20 && max_temp >= 20
      'Wear light clothes and maybe a sweater'
    elsif min_temp >= 20 && max_temp >= 20
      'Wear light clothes'
    end
  end

  def rain_clothes(rain_chance)
    if rain_chance >= 1 && rain_chance < 20
      'Small chance of rain today, take your chances with the rain jacket'
    elsif rain_chance >= 20 && rain_chance < 75
      'Possible rain today, consider taking a rain jacket'
    elsif rain_chance >= 75 && rain_chance < 90
      'High chance of rain today, take your rain jacket and umbrella'
    elsif rain_chance >= 90
      'Take your rain jacket and umbrella'
    elsif rain_chance < 1
      'No rain expected today'
    end
  end
end
