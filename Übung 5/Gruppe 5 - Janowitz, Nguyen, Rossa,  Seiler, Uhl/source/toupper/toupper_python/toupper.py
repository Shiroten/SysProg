import sys

# first element is pythonscript filename
if len(sys.argv) >= 3:
	name_in = sys.argv[1]
	name_out = sys.argv[2]

	with open(name_in, 'r' ) as file_in, open(name_out, 'w') as file_out:
		file_out.write(file_in.read().upper())
