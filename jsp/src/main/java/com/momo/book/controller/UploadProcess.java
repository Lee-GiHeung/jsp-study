package com.momo.book.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.FileDao;
import com.momo.dto.FileDto;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/upload/uploadProcess")
public class UploadProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("method : get").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// enctype을 지정하게 되면 requset.getParameter()를 이용해서 폼 요소의 값을 읽어올 수 없다
		// System.out.println("requset.getParameter()" + request.getParameter("name"));
		
		// 업로드된 파일의 정보를 출력	
		/*
		 *  1. MultipartRequest 객체 생성
		 *  	요청 파일을 해당 경로에 저장
		 *  	 - 파일을 저장할 경로를 지정 해주어야 함
		 *  	 - 파일의 최대 사이즈를 지정함
		 *    	 - 한글깨짐이 발생할 수 있으므로 인코딩 타입 지정	
		 *
		 *		객체가 정상적으로 실행되면 파일은 자동으로 지정경로에 저장 됨
		 *		생성자의 매개변수로 저장경로, 파일의 최대크기, 인코딩 방식을지정
		 */	
		MultipartRequest mr = new MultipartRequest(request, "c:/upload", 1024*1000, "utf-8");
		
		// 요청 정보를 수집하여 DTO객체를 생성 
		// 업로드된 정보를 DB에 저장하기 위해
		FileDto fileDto = new FileDto();
		fileDto.setName(mr.getParameter("name"));
		fileDto.setTitle(mr.getParameter("title"));
		fileDto.setCate(mr.getParameterValues("cate"));
		
		System.out.println("=======================");
		System.out.println("fileDto : " + fileDto);
		
		// name 속성을 이용해 파일을 확인
		String fileName = mr.getFilesystemName("attachedFile");
		
		/*
		 *  파일이 첨부된 경우 파일명이 중복되어 파일이 유실되는 경우를 방지하기 위해 파일명을 변경함
		 *  	- 중복된 파일을 업로드 하는 경우 기존에 저장된 파일이 소실될 우려가 있으므로 파일명을 변경하여 저장합니다
		 *  	- 파일을 저장할때에는 /년/월/일 폴더를 생성후 파일명에 날짜를 붙여서 저장
		 *  	- 파일을 저장할 때 파일명_날짜시간.확장자
		 *  	- 파일을 저장할 때 날짜시간_파일명.확장자
		 */
		if(fileName != null && !fileName.equals("") ) {
			// 새로운 파일 이름을 생성 : 원본파일명 + 시간날짜(uuid) + 확장자
			// H : 0~23, S: millisecond
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			// 첨부파일의 확장자
			String ext = fileName.substring(fileName.lastIndexOf("."));
			
			// 원본파일 이름
			String oFileName = fileName.substring(0, fileName.lastIndexOf("."));
			String newFileName = oFileName + "_" + now + ext;
			System.out.println("newFileName : " + newFileName);
			
			File oldFile = new File("c:upload/" + fileName);
			File newFile = new File("c:upload/" + newFileName);
			
			// 파일이름을 변경 합니다
			oldFile.renameTo(newFile);
				
			// 원본파일명과, 변경된 파일명을 각각 DTO에 저장 합니다
			fileDto.setOfile(fileName);
			fileDto.setSfile(newFileName);
			
		}		
		System.out.println("파일명 : " + fileName);
		
		// 입력된 내용을 DB에 저장 합니다
		FileDao dao = new FileDao();
		int res = dao.regFile(fileDto);
		
		if(res > 0) {
			request.setAttribute("msg", "등록되었습니다");
			// list.jsp를 바로 호출할경우 데이터를 조회 할 수 없으므로
			// 서블릿을 호출
			request.setAttribute("url", "/upload/list.jsp");
						
		} else {
			request.setAttribute("msg", "등록중 예외사항이 발생 하였습니다.");

		}
		request.getRequestDispatcher("/book/msgBox.jsp").forward(request, response); 
		
	}
	
}