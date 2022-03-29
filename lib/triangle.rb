class Triangle
  
  attr_accessor :equilateral, :isosceles, :scalene, :left, :right, :bottom

  

  def initialize(l1, l2, l3)

    @left = l1
    @right = l2
    @bottom = l3
    
  end

  def kind
    if @left + @right + @bottom != 0 && @left.positive? && @right.positive? && @bottom.positive? && @left + @right > @bottom && @left + @bottom > @right && @right + @bottom > @left
      @triangle = []
      combine
  
      sum = @triangle.uniq.size
  
      if sum == 1
        :equilateral
      elsif sum == 2
        :isosceles
      else
        :scalene
      end
  
    else
        raise TriangleError
    end
  end

  private

  def combine
    @triangle << left
    @triangle << right
    @triangle << bottom
  end


  class TriangleError < StandardError
    def message
      "No length detected"
    end
  end


end
