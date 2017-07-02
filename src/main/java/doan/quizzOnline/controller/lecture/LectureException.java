package doan.quizzOnline.controller.lecture;

public class LectureException extends RuntimeException{

	
	@Override
	public String getMessage() {
		return super.getMessage();
	}

	@Override
	public String toString() {
		return super.toString();
	}

	public LectureException(String message) {
		super(message);
	}
	
	public static class NoQuizzsOfPartException extends RuntimeException{

		public NoQuizzsOfPartException(String message) {
			super(message);
		}

		@Override
		public String getMessage() {
			return super.getMessage();
		}
		@Override
		public String toString() {
			return super.toString();
		}
	}
	
}
