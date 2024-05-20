package com.mycompany.javajavajo.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.Qna;
import com.mycompany.javajavajo.security.Tm1UserDetails;
import com.mycompany.javajavajo.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/qna")
public class QnaController {
	@Autowired
	private QnaService qnaService;

	@GetMapping("/qna_list")
	public String qnaList(Authentication authentication, String pageNo, String keyword, Model model,
			HttpSession session) {
		
		if (pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
		}
		
		if(keyword == null) {
			keyword = (String) session.getAttribute("keyword");
		}
		// 세션에 pageNo변수를 선언하고 값을 할당
		session.setAttribute("pageNo", pageNo);
		session.setAttribute("keyword", keyword);
		
		
		// pageNo를 정수형으로 변환
		int intPageNo = Integer.parseInt(pageNo);
		// Pager 객체 생성
		int rowsPagingTarget = qnaService.getTotalRows(keyword);
		log.info(rowsPagingTarget+"");
		Pager pager = new Pager(10, 5, rowsPagingTarget, intPageNo);

		// Service에서 게시물 목록 요청
		List<Qna> qnaList = qnaService.getQnaList(pager, keyword);

		model.addAttribute("pager", pager);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("keyword", keyword);
		
		return "qna/list";

	}

	// 글쓰기 페이지로 이동
	@Secured("ROLE_USER")
	@GetMapping("/write_qna")
	public String writeQnaForm() {
		return "qna/writeQna";
	}

	//신우호 - form 데이터로 Qna(dto)객체를 매개변수로 받아옴
	@PostMapping("/write_qna")
	// 로그인한 사용자(인증객체)면 글쓰기를 작성할 수 있도록 함
	public String writeQna(Qna qna, Authentication authentication) {
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
		Member member  = t1UserDetails.getMember();
		qna.setMemno(member.getMemno());
		// 첨부파일이 null값이 아니고 비어있지 않으면 첨부파일의 오리지널 네임과, 타입을 세팅해줌
		if (qna.getQnaattach() != null && !qna.getQnaattach().isEmpty()) {
			// 첨부파일의 이름과 타입을 세팅해줌
			qna.setQnaattachoname(qna.getQnaattach().getOriginalFilename());
			qna.setQnaattachtype(qna.getQnaattach().getContentType());
			try {
				qna.setQnaattachdata(qna.getQnaattach().getBytes());
			} catch (Exception e) {
			}
		}
		qnaService.writeBoard(qna);
		return "redirect:/qna/qna_list";
		// 클라이언트 요청 -> 컨트롤러 -> 클라이언트 -> 경로로 이동시킴
	}

	@GetMapping("/qna_detail")
	public String qnaDetail(int qnano, Model model, HttpSession session) {
		String keyword = (String) session.getAttribute("keyword");
		Qna qna = qnaService.getQna(qnano,keyword); // dto를 통해서 한 게시물의 정보를 가져옴
		int pageNo = (qna.getRnum() - 1) / 10 + 1;
		session.setAttribute("pageNo", pageNo + "");
		model.addAttribute("qna", qna);
		return "qna/detail";
	}

	// 글수정할 페이지 이동
	@Secured("ROLE_USER")
	@GetMapping("/update_qna")
	public String updateQnaForm(int qnano, Model model) {
		String keyword = "";
		Qna qna = qnaService.getQna(qnano,keyword);
		model.addAttribute("qna", qna);
		return "qna/updateQna";
	}

	// 글수정된 페이지로 이동
	@Secured("ROLE_USER")
	@PostMapping("/update_qna")
	public String updateQna(Qna qna) {
		
		if (qna.getQnaattach() != null && !qna.getQnaattach().isEmpty()) {

			qna.setQnaattachoname(qna.getQnaattach().getOriginalFilename());
			qna.setQnaattachtype(qna.getQnaattach().getContentType());

			try {
				qna.setQnaattachdata(qna.getQnaattach().getBytes());
			} catch (Exception e) {
			}
		}
		
		qnaService.updateQna(qna);
		
		return "redirect:/qna/qna_detail?qnano=" + qna.getQnano();
	}
	
	//권우상 - 글쓰기 페이지로 이동
	@Secured("ROLE_USER")
	@GetMapping("/delete_qna")
	public String deleteQna(int qnano) {
		qnaService.deleteQna(qnano);
		return "redirect:/qna/qna_list";
	}
	
	//권우상 - qna 첨부파일 다운로드 메소드
	@GetMapping("/downloadQnaAttach")
	public void downloadQnaAttach(int qnano, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		Qna qnaAttach = qnaService.getQnaAttach(qnano);
		log.info("run");
		byte[] qnaAttachData = qnaAttach.getQnaattachdata();
		
		
		response.setContentType(qnaAttach.getQnaattachtype());
		String fileName = new String(qnaAttach.getQnaattachoname().getBytes("UTF-8"),"ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\"");
		if(qnaAttachData == null) {
			log.info("null"); 
		}
		log.info("run2");
		OutputStream os = response.getOutputStream();
		os.write(qnaAttachData);
		os.flush();
		os.close();
	}
	
	//권우상 - 글 수정 페이지에서 첨푸파일 삭제 처리 메소드
	@Secured("ROLE_USER")
	@PostMapping(value="/delete_attach", produces="application/json; charset=UTF-8")
	@ResponseBody()
	public String deleteAttach(int qnano) {
		int result = qnaService.deleteAttach(qnano);
		
		String jsonResult = (result > 0) ? "success" : "fail";
		JSONObject jo = new JSONObject();
		jo.put("result", jsonResult);
		return jo.toString();
	}
	
	//권우상 - 관리자가 게시판에서 답변을 작성 할 때 사용하는 메소드
	@Secured("ROLE_ADMIN")
	@PostMapping(value="/write_reply", produces="application/json; charset=UTF-8")
	@ResponseBody()
	public String writeReply(int qnano, String reply) {
		int result = qnaService.writeReply(qnano, reply);
		
		String jsonResult = (result > 0) ? "success" : "fail";
		JSONObject jo = new JSONObject();
		jo.put("result", jsonResult);
		return jo.toString();
	}
	
	//권우상 - 관리자가 게시판에서 답글 수정 할 때 사용 하는 메소드
	@Secured("ROLE_ADMIN")
	@PostMapping(value="/edit_reply", produces="application/json; charset=UTF-8")
	@ResponseBody()
	public String editReply(int qnano, String reply) {
		int result = qnaService.writeReply(qnano, reply);
		
		String jsonResult = (result > 0) ? "success" : "fail";
		JSONObject jo = new JSONObject();
		jo.put("result", jsonResult);
		return jo.toString();
	}
}
