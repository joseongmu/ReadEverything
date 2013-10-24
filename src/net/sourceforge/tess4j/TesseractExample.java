package net.sourceforge.tess4j;

import java.io.File;

public class TesseractExample {
	String result;

	public TesseractExample() {
		File imageFile = new File("eurotext.tif");
		Tesseract instance = Tesseract.getInstance(); // JNA Interface Mapping
		
		try {
			result = instance.doOCR(imageFile);
		} catch (TesseractException e) {
			System.err.println(e.getMessage());
		}
	}
	
	public String getResult() {
		return "hello";
	}
}