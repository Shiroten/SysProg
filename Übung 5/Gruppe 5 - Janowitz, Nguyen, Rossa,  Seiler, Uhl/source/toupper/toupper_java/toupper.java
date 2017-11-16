public static void main(Sting() args) {

    if args.length != 2{
        return System.out.println("Bitte input und output file eingeben");
        }
    BufferedReader br = new BufferedReader(new FileReader(args[0]));
    try {
    	StringBuilder sb = new StringBuilder();
        String line = br.readLine();

        while (line != null) {
        	sb.append(line);
        	sb.append(System.lineSeparator());
        	line = br.readLine();
        	}
        String everything = sb.toString();
        } finally {
        	br.close();
        	}
    everything = everything.toUpperCase();
    FileUtils.writeStringToFile(new File(args[1]), everything);
}