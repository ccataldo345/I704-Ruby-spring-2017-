File.open('input.csv', 'r') do |the_file|

	lines = the_file.readlines.map do |line|
		line.chomp.split(',')
	end

	lines = lines[1..-1]
	debit_total = ''
	lines.each do |line|
		debit_total = debit_total + line[2]
  end

	puts debit_total
end