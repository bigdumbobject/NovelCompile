# Append files together

Dir.chdir(ARGV[0])

all_files = ""

Dir["**/*"].sort_by { |a| a }		\
	.each { |x|
		if File.directory? x 
			all_files << "\n\n== " + x + " ==\n\n"
		else
			all_files << File.open(x, "rb").read
			all_files << "\n#\n"
		end
	}

Dir.chdir("..")
File.open(ARGV[0] + ".txt", "w").puts(all_files)


