import java.io.*;

class toupper {
    public static void main(String args[]) {

        BufferedReader br;
        String everything = "";

        try {
            br = new BufferedReader(new FileReader(args[0]));
            StringBuilder sb = new StringBuilder();
            String line = br.readLine();

            while (line != null) {
                sb.append(line);
                sb.append(System.lineSeparator());
                line = br.readLine();
            }
            everything = sb.toString();
        } catch (IOException e){
            e.printStackTrace();
        }
        everything = everything.toUpperCase();
        try {
            PrintWriter out = new PrintWriter(args[1]);
            out.println(everything);
            out.close();
        } catch (FileNotFoundException e){
            e.printStackTrace();
        }

    }
}
