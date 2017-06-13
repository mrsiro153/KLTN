package doan.quizzOnline.DTO;

public class Quizz {
	String MaCauHoi;
	String NoiDung;
	String DapAnDung;
	String DapAnA;
	String DapAnB;
	String DapAnC;
	String DapAnD;
	String YourAnswer;
	public Quizz(String maCauHoi, String noiDung, String dapAnDung, String dapAnA, String dapAnB, String dapAnC,
			String dapAnD) {
		super();
		MaCauHoi = maCauHoi;
		NoiDung = noiDung;
		DapAnDung = dapAnDung;
		DapAnA = dapAnA;
		DapAnB = dapAnB;
		DapAnC = dapAnC;
		DapAnD = dapAnD;
	}
	public Quizz(String maCauHoi){
		this.MaCauHoi=maCauHoi;
	}
	public Quizz(String maCauHoi,String YourAnswer){
		this.MaCauHoi=maCauHoi;
		this.YourAnswer=YourAnswer;
	}
	public String getMaCauHoi() {
		return MaCauHoi;
	}
	public void setMaCauHoi(String maCauHoi) {
		MaCauHoi = maCauHoi;
	}
	public String getNoiDung() {
		return NoiDung;
	}
	public void setNoiDung(String noiDung) {
		NoiDung = noiDung;
	}
	public String getDapAnDung() {
		return DapAnDung;
	}
	public void setDapAnDung(String dapAnDung) {
		DapAnDung = dapAnDung;
	}
	public String getDapAnA() {
		return DapAnA;
	}
	public void setDapAnA(String dapAnA) {
		DapAnA = dapAnA;
	}
	public String getDapAnB() {
		return DapAnB;
	}
	public void setDapAnB(String dapAnB) {
		DapAnB = dapAnB;
	}
	public String getDapAnC() {
		return DapAnC;
	}
	public void setDapAnC(String dapAnC) {
		DapAnC = dapAnC;
	}
	public String getDapAnD() {
		return DapAnD;
	}
	public void setDapAnD(String dapAnD) {
		DapAnD = dapAnD;
	}
	public String getYourAnswer() {
		return YourAnswer;
	}
	public void setYourAnswer(String YourAnswer) {
		this.YourAnswer = YourAnswer;
	}
}