# http://serviver-challenge.herokuapp.com/problems/25

def main
	puts '計算式を入力してください'
  puts '終了する場合はexitと入力してください'

loop do
  calculation = gets.chomp
  case calculation
  when 'exit' then
    puts '終了します'
    break
  else
    calc(calculation.chars.filter { |c| c unless c == ' '})
  end
end

def calc(calculation)
	formula = []
	kari = []
	for i in 1..calculation.size do
		case calculation[i - 1]
		when /[0-9]/
		case calculation[i]
		when /[0-9]/
			kari << calculation[i - 1]
		else
			if kari.empty?
				formula << calculation[i - 1]
			else
				kari << calculation[i - 1]
				formula << kari.join 
			end
		end
		when /[+\-*\/]/
			if /[+\-*\/]/ == calculation[i]
				puts '正しい計算式ではありません'
			else
				formula << calculation[i -1]
				kari = []
			end
		else
			puts '正しい計算式ではありません'
			break
		end
	end
	sum(formula)
end

def sum(formula)
	sumtotal = formula[0].to_i
	formula.each_with_index do |f, i|
		if i % 2 != 0
			case f
			when /[+]/
				sumtotal = "#{sumtotal.to_i + formula[i + 1].to_i}"
			when /[\-]/
				sumtotal = "#{sumtotal.to_i - formula[i + 1].to_i}"
			when /[*]/
				sumtotal = "#{sumtotal.to_i * formula[i + 1].to_i}"
			when /[\/]/
				sumtotal = "#{sumtotal.to_i / formula[i + 1].to_i}"
			end
		end
	end
	puts sumtotal
end

main