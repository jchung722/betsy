module OrdersHelper

  def final_total(array)
    total = 0

    array.each do |item|
      total += item.total
    end

    return total
  end

end
