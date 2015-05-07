File.open(ARGV[1], 'w+') do |o|
  File.open(ARGV[0], 'r') do |f|
    test_cases = f.gets.to_i

    test_cases.times do |i|
      credit = f.gets.chomp!.to_i
      n = f.gets.chomp!.to_i
      cases = f.gets.chomp!.split(' ').map{|n| n.to_i}

      sorted = [].replace(cases).sort
      find = 0
      a_i, b_i = 0, n-1

      while true
        a = sorted[a_i]
        b = sorted[b_i]
        puts "#{a}, #{b}"
        find = credit - a
        if b > find
          b_i -= 1
        elsif find > b
          a_i += 1
        elsif b == find || a_i == b_i
          break
        end
      end

      a , b = cases.index(a), cases.rindex(b)
      if a > b
        temp = b
        b = a
        a = temp
      end
      o.puts "Case ##{i+1}: #{a+1} #{b+1}"
    end
  end
end
