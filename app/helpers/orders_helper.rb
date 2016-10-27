module OrdersHelper

  def final_total(array)
    total = 0

    array.each do |item|
      total += item.total
    end

    return total
  end

  def complete_check(array)
    array.each do |item|
      if item.status == "unfulfilled"
        return false
      end
    end
    return true
  end
end
