class Array
    def my_uniq
        arr = []
        self.each { |ele| arr << ele if !arr.include?(ele) }
        arr
    end

    def two_sum
        arr = []
        length = self.length
        (0...length).each do |i|
            (i+1...length).each do |j|
                arr << [i, j] if self[i] + self[j] == 0
            end
        end
        arr
    end

    def my_transpose
        size = self.length
        new_arr = Array.new(size){Array.new(size)}
        (0...size).each do |i|
            (0...size).each do |j|
                new_arr[i][j] = self[j][i]
            end
        end
        new_arr
    end
end

def stock_picker(arr)
    length = arr.length
    return [] if length < 2
    max = arr[1] - arr[0]
    pair = [0,1]
    (0...length-1).each do |i|
        (i+1...length).each do |j|
            current_profit = arr[j] - arr[i]
            if current_profit > max
                max = current_profit
                pair = [i, j]
            end
        end
    end
    pair
end

class TowersofHanoi
    attr_reader :stacks
    def initialize(stacks)
        @stacks = stacks
    end

    def move(start_rod, end_rod)
        moving_disk = @stacks[start_rod].pop
        if !@stacks[end_rod].empty?
            comparing_disk = @stacks[end_rod].last
            raise "can't move a larger disk onto a smaller one" if moving_disk > comparing_disk 
        end 
        @stacks[end_rod].push(moving_disk)
    end

    def won?
        @stacks[1].sort == @stacks[1].reverse &&
        @stacks[0].empty? &&
        @stacks[2].empty?
    end
end
