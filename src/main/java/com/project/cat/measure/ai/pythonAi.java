package com.project.cat.measure.ai;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.lang.ProcessBuilder;
import java.io.InputStreamReader;

public class pythonAi {

	public String aiValue(String save_path, String img_name) {
		String value = null;
		
		//기본 이미지 경로
//		String img_path = "C:/CatProject/AI_Python/img/";
//		String img_path = "C:/CatProject/cat/src/main/webapp/resources/ai_cat_img/";
		
		//기본 경로
//		String img_path = "C:/CatProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/cat/resources/ai_cat_img/";
		//강의장 경로
//		String img_path = "C:/CatProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/cat/resources/ai_cat_img/";

		//이미지 명
//		String img_name = "20220404101625_ehdwn";
		
//		String img_path_name = img_path + img_name;
//		System.out.println("경로 : "+img_path_name);
		
		save_path += "/";
				
		//파이썬 인터프리터 경로 통일하세요
		//C:/ProgramData/Anaconda3/envs/AI(경로 폴더명 통일하세요)/python.exe
		String command = "C:/ProgramData/Anaconda3/envs/AI/python.exe";
		
		//기본 파이썬 코드 경로
		String arg1 = "C:/CatProject/AI_Python/aiResult.py";
		
		try {
			ProcessBuilder builder = new ProcessBuilder(command, arg1, save_path, img_name);
			//System.out.println(">>>  1");
			Process process = builder.start();
			int exitVal = process.waitFor();
			BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(), "euc-kr"));
			String line;
			
			//System.out.println(">>>  2" + br.readLine());
			while ((line = br.readLine()) != null) {
				System.out.println(">>>  " + line);
				value = line;
			}
			
			if(exitVal != 0) {
				System.out.println("error on process");
				System.out.println(exitVal);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("값 : "+ value);
		
		return value.trim();
	}
}
