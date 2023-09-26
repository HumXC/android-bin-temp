package shiroko;

public class Main {
  static {
    System.loadLibrary("shiroko");
  }

  public static void main(String[] args) {
    int result = cppMain(args);
    System.exit(result);
  }

  public static native int cppMain(String[] args);
}
