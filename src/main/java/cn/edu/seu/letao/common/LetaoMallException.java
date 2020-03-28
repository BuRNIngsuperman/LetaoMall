package cn.edu.seu.letao.common;

public class LetaoMallException extends RuntimeException {

    public LetaoMallException() {
    }

    public LetaoMallException(String message) {
        super(message);
    }

    /**
     * 丢出一个异常
     *
     * @param message
     */
    public static void fail(String message) {
        throw new LetaoMallException(message);
    }

}
