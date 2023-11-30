package sistema_loja2023.infraestructure.exceptions;

public class CustomException extends Exception {
	private String detail;

	private final static boolean debuggMode = true;

	public CustomException(String msg) {
		super(msg);
	}

	public CustomException(String msg, String detail) {
		super(msg);
		this.detail = detail;
	}

	public String getDetail() {
		if(CustomException.debuggMode) {
			return this.detail;
		}
		return "";
	}
}
