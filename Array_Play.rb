class ArrayPlay
  def eachmethod
    a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    x = a.each { |e| e * 2 }  # each return the original array, so to perform work in each do inside block only

    puts ""
    puts x  # return original array
    puts ""
    puts a  # return original array
  end

  def mapmethod
    a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    x = a.map { |e| e * 2 }   # map returns the modified array according to function in block, if no block is given
                              #  in both then enumerator is returned, collect method is alias for map, map is more popular (mc)

    puts ""
    puts x   # return modified array
    puts ""
    puts a   # return original the array
  end

  def injectmethod
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].inject { |sum, e| sum += e }
    # returns 55
    ["bar", "baz", "quux"].inject("foo") { |acc, elem| acc + "!!" + elem } # (ri)
    # returns "foo!!bar!!baz!!quux"
    #reduce method  in alias for inject
  end

  def selectMethod
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select { |el| el % 2 == 0 }
    # returns [2,4,6,8,10], select method works as filter (sf)
  end

  def find
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].find { |el| el / 2 == 2 }
    # returns 4, search method (fs)
  end
end

ArrayPlay.new.eachmethod
