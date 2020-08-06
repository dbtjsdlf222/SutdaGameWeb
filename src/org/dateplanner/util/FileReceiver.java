package org.dateplanner.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileReceiver {
	
	private static String saveFile(MultipartFile multipartFile, String uploadPath) throws IOException {
		
		String originalFileName = multipartFile.getOriginalFilename();
		String fileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileName.substring(originalFileName.lastIndexOf('.'));

		File file = null;
		while((file = new File(uploadPath + fileName)).exists());
		multipartFile.transferTo(file);
		
		return fileName;
		
	} //uploadFile();
	
	public static String receiveFile(MultipartHttpServletRequest request, String uploadPath) {
		
		String result = null;
		
		uploadPath = request.getServletContext().getRealPath(uploadPath);
		
		Iterator<String> fileNames = request.getFileNames();
		if(fileNames.hasNext()) {
			
			try { result = saveFile(request.getFile(fileNames.next()), uploadPath); }
			catch (IOException e) { e.printStackTrace(); }
			
		}
		
		return result;
		
	} //getFile();
	
	public static List<String> receiveFiles(MultipartHttpServletRequest request, String uploadPath) {
		
		List<String> result = new ArrayList<>();
		uploadPath = request.getServletContext().getRealPath(uploadPath);
		
		Iterator<String> fileNames = request.getFileNames();
		while(fileNames.hasNext()) {
			
			try { result.add(saveFile(request.getFile(fileNames.next()), uploadPath)); }
			catch (IOException e) { e.printStackTrace(); }
			
		}
		
		return result;
		
	} //getFileList();
	
} //class FileUploadUtil;
