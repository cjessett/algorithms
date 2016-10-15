def highest_product_of_3(array)

  # return product of all unless unless there are more than 3
  return array.inject(:*) unless array.count > 3

  # sort first three integers
  first_3 = array[0..2].sort

  # initialize highest 3 and lowest 2 with first three integers
  max_1, max_2, max_3 = first_3[2], first_3[1], first_3[0]
  min_1, min_2 = first_3[0], first_3[1]

  # iterate through the rest of the integers
  # keep track of highest 3 and lowest 2 integers
  array[3..-1].each do |int|

    # check for higher maximums
    if int > max_1
      # reassign max_3, max_2, and max_1
      max_3 = max_2
      max_2 = max_1
      max_1 = int
    elsif int > max_2
      # reassign max_3 and max_2
      max_3 = max_2
      max_2 = int
    elsif int > max_3
      # reassign max_3
      max_3 = int
    end

    # check for lower minimums
    if int < min_1
      # reassign min_2 and min_1
      min_2 = min_1
      min_1 = int
    elsif int < min_2
      # reassign min_2
      min_2 = int
    end
  end

  # compute product of highest 3
  prod_1 = max_1 * max_2 * max_3
  # compute product of lowest 2 * highest 1
  prod_2 = max_1 * min_1 * min_2

  prod_1 > prod_2 ? prod_1 : prod_2
end

# I thought about this in cases of the signs of the integers

# + (Only 1 positive)
# In the case you are given only 1 positive integer and the rest negative
# you want the product of the 2 most-negative integers and the single positive integer

# In the case you have


# ++ (Only 2 positives)
# In the case you are given only 2 positive integers and the rest negative
# you want the product of the 2 most negative integers * (the highest positive integer)

# - (Only 1 negative)
# In the case you are given 1 negative integer and the rest positive
# you want the product of the 3 highest integers

# -- (Only 2 negatives)
# In the case you are given 2 negative integers and the rest positive
# you want the greater of:
  # (product of 2 most negative) * (largest positive) -- max_1 * min_1 * min_2
  # product of 3 largest positive integers            -- max_1 * max_2 * max_3

#


