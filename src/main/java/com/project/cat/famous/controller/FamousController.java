package com.project.cat.famous.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.cat.common.Paging;
import com.project.cat.famous.model.service.FamousService;
import com.project.cat.famous.model.vo.Famous;
import com.project.cat.member.model.vo.Member;

@Controller
public class FamousController {

	private static final Logger logger = LoggerFactory.getLogger(FamousController.class);

	@Autowired
	private FamousService famousService;

	@RequestMapping("famous.do")
	public String moveLoginPage() {
		return "famous/famous";

	}

	// 게시글 페이지단위로 목록 조회 처리용
	@RequestMapping("flist.do")
	public ModelAndView famousListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 계산 처리 => 별도의 클래스로 작성해서 사용해도 됨 ----------------------------
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		// 페이지 수 계산을 위해 총 목록 갯수 조회
		int listCount = famousService.selectListCount();
		// 페이지 수 계산
		// 주의 : 목록이 11개이면, 페이지 수는 2가 됨 (나머지 목록 1개도 출력페이지가 1개 필요함)
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작 값을 지정(뷰 아래쪽에 표시할 페이지 수를 10개씩 한 경우)
		int startPage = (int) ((double) currentPage / 10 + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 끝값
		int endPage = startPage + 10 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 쿼리문에 전달할 현재페이지에 출력할 목록의 첫행과 끝행 객체 처리
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Paging paging = new Paging(startRow, endRow);

		// 별도의 클래스 작성 끝 ------------------------------------------------------

		// 서비스 메소드 실행하고 결과받기
		ArrayList<Famous> list = famousService.selectList(paging);
		System.out.println(list);
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);

			mv.setViewName("famous/famousAdminDetailView");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 뷰 페이지 이동 처리용 --------------------------------------------------
	// 새 공지글 등록 페이지로 이동 처리용
	@RequestMapping("movewrite.do")
	public String moveWritePage() {
		return "famous/famousWriteForm";
	}

	// 게시 원글 등록 처리용
	@RequestMapping(value = "finsert.do", method = RequestMethod.POST)
	public String famousInsertMetohd(Famous famous, HttpServletRequest request, Model model,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		// 업로드 된 파일 저장 폴더 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/famous_upfiles");

		// 첨부파일이 있을때만 업로드 된 파일을 지정 폴더로 옮기기
		if (!mfile.isEmpty()) {
			String fileName = mfile.getOriginalFilename();
			// 이름바꾸기 처리 : 년월일시분초.확장자
			if (fileName != null && fileName.length() > 0) {
				// 바꿀 파일명에 대한 문자열 만들기
				// 공지글 등록 요청시점의 날짜정보를 이용함
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				// 변경할 파일이름 만들기
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
				// 원본 파일의 확장자를 추출해서, 변경 파일명에 붙여줌
				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);

				// 파일 객체 만들기
				File originFile = new File(savePath + "\\" + fileName);
				File renameFile = new File(savePath + "\\" + renameFileName);

				// 업로드 파일 저장시키고, 바로 이름바꾸기 실행함
				try {
					mfile.transferTo(renameFile);
				} catch (IOException e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패.");
					return "common/error";
				}
				famous.setCat_original_img(fileName);
				famous.setCat_rename_img(renameFileName);
			}
		} // 첨부파일이 있을 때만 구동되는 블럭

		if (famousService.insertOriginFamous(famous) > 0) { // 게시 원글 등록 성공시
			return "redirect:famous.do?page=1";
		} else {
			model.addAttribute("message", "게시 원글 등록 실패.");
			return "commmon/error";
		}
	}

//		// 인기고양이글 상세보기 처리
//		@RequestMapping("fdetail.do")
//		public ModelAndView famousDetailMethod(ModelAndView mv, 
//				@RequestParam("register_num") int register_num,
//				@RequestParam(name = "page", required = false) String page) {
//			int currentPage = 1;
//			if (page != null) {
//				currentPage = Integer.parseInt(page);
//			}
	//
//			// 해당 게시글 조회
//			Famous famous = famousService.selectFamous(register_num);
	//
//			if (famous != null) {
//				mv.addObject("famous", famous);
//				mv.addObject("currentPage", currentPage);
//				mv.setViewName("famous/famousDetailView");
//			} else {
//				mv.addObject("message", register_num + "번 게시글 조회 실패.");
//				mv.setViewName("common/error");
//			}
	//
//			return mv;
//		}

	// 첨부파일 다운로드 요청 처리용

	@RequestMapping("ffdown.do")
	public ModelAndView fileDownMethod(HttpServletRequest request, @RequestParam("ofile") String originFileName,
			@RequestParam("rfile") String renameFileName, ModelAndView mv) {
		// 공지사항 첨부파일 저장 폴더 경로 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/famous_upfiles");
		// 저장 폴더에서 읽을 파일에 대해 경로 추가하면서 File 객체 생성
		File renameFile = new File(savePath + "\\" + renameFileName); // 다운을 위해 재보내는 파일 객체생성
		File originFile = new File(originFileName);

		mv.setViewName("filedown"); // 등록된 파일다운로드 처리용 뷰 클래스 id 명
		mv.addObject("renameFile", renameFile); // 전달할 파일 객체 Model저장
		mv.addObject("originFile", originFile);

		return mv;

	}

	// 글 삭제
	@RequestMapping("fdel.do")
	public String boardDeleteMethod(Famous famous, HttpServletRequest request, Model model) {
		if (famousService.deleteFamous(famous) > 0) {
			// 글삭제 성공시 저장폴더에 첨부파일도 삭제 처리
			if (famous.getCat_original_img() != null) {
				new File(request.getSession().getServletContext().getRealPath("resources/famous_upfiles") + "\\"
						+ famous.getCat_rename_img()).delete();
			}
			return "redirect:famous.do?page=1";

		} else {
			model.addAttribute("message", famous.getRegister_num() + "번 글 삭제 실패.");
			return "common/error";
		}
	}

	// 글 수정
	@RequestMapping("fupview.do")
	public String moveBoardUpdateView(@RequestParam("register_num") int register_num,

			@RequestParam("page") int currentPage, Model model) {

		Famous famous = famousService.selectFamous(register_num);
		if (famous != null) {
			model.addAttribute("famous", famous);
			model.addAttribute("page", currentPage);
			return "famous/famousUpdateView";
		} else {
			model.addAttribute("message", register_num + "번 글 수정 페이지로 이동 실패.");

			return "common/error";
		}
	}

	// 인기고양이글 상세보기 요청 처리용
	@RequestMapping("fdetail.do")
	public String noticeDetailMethod(@RequestParam("register_num") int register_num, Model model, HttpSession session) {
		Famous famous = famousService.selectFamous(register_num);

		if (famous != null) {
			model.addAttribute("famous", famous);
			Member loginMember = (Member) session.getAttribute("loginMember");
			if (loginMember != null && loginMember.getAdmin_ok().equals("Y")) {
				// 관리자가 상세보기 요청을 했을 때
				return "famous/famousAdminDetailView";
			} else {
				// 관리자가 아닌 클라이언트가 상세보기 요청했을 때
				return "famous/famouseDetailView";
			}
		} else {
			model.addAttribute("message", register_num + "번 공지글 상세보기 실패!");
			return "common/error";
		}
	}
	//상세정보 페이지로 이동하는 Method
	@RequestMapping("detailMove.do")
	public String moveDetailView() {
		return "famous/famousDetailView";
	}
	
	//관리자용 상세정보 페이지로 이동하는 Method
	@RequestMapping("famousListView.do")
	public String moveAdminDetailView() {
		return "famous/famousAdminDetailView";
	}
}
