public class TimesPow {
	
	public static int pow2(int x, int b) {
		return x << b;
	}
	
	public static void main(String[] args){
		
		int result = TimesPow.pow2(2, 3);
		result += TimesPow.pow2(3, 2);
		
		System.out.println("Java: " + result);
	}
	 
	 
}