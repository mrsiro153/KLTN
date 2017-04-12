package doan.quizzOnline;

import org.apache.log4j.Level;


public class MainClass {
	final static org.apache.log4j.Logger logger2= org.apache.log4j.Logger.getLogger(MainClass.class);
	/*
	public static void main(String[] args) {
		testLog4j2();
	}
	*/
	public static void testLog4j2(){
		System.out.println("-------------------");
		logger2.setLevel(Level.DEBUG);
		logger2.info("info");
		logger2.debug("debug");
		logger2.error("error");
		logger2.trace("trace");
		logger2.fatal("fatal");
		logger2.warn("warning");
		System.out.println("-------------------");
	}

}
