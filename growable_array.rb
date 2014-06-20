def Malloc(n)
  [0]*n
end

class GrowableArray
    attr_reader :length
  
    def initialize
        @length = 0
        @capacity = 0
        @data = Malloc(0)
    end

    def add(value)
        if @capacity == @length
            copy
        end
        @data[@length] = value
        @length += 1
    end
    
    def get(n)
        @data[n] if n >= 0 && n < @length
    end
    
    private

    def copy
        old_data = @data
        @capacity = @length * 2
        @data = Malloc(@capacity)

        index = 0
        while index < @length 
            @data[index] = old_data[index]
            index += 1
        end
    end
    
end


ga = GrowableArray.new
ga.add(4)
ga.add(10)
ga.add(5)

ga.length == 3
ga.get(2) == 5

ga.add(8)
ga.length == 4
ga.get(3) == 8

ga.get(100) == nil
