package com.mycompany.javajavajo.controller;

import static org.junit.jupiter.api.Assumptions.assumingThat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.Qna;
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
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);

		// Service에서 게시물 목록 요청
		List<Qna> qnaList = qnaService.getQnaList(pager, keyword);

		model.addAttribute("pager", pager);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("keyword", keyword);
		
		return "qna/list";

	}

	// 글쓰기 페이지로 이동
	@GetMapping("/write_qna")
	public String writeQnaForm() {
		return "qna/writeQna";
	}

	// 글쓰기 페이지에서 dto로 게시물 작성에 필요한 정보들을 얻어옴
	// Controller에서 Service로 요청
	@PostMapping("/write_qna")
	public String writeQna(Qna qna) {
		// 첨부파일이 null값이 아니고 비어있지 않으면 첨부파일의 오리지널 네임과, 타입을 세팅해줌
		if (qna.getQnaattach() != null && !qna.getQnaattach().isEmpty()) {

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
		int pageNo = (qna.getRnum() - 1) / 5 + 1;
		session.setAttribute("pageNo", pageNo + "");
		model.addAttribute("qna", qna);
		return "qna/detail";
	}

	// 글수정할 페이지 이동
	@GetMapping("/update_qna")
	public String updateQnaForm(int qnano, Model model) {
		String keyword = "";
		Qna qna = qnaService.getQna(qnano,keyword);
		model.addAttribute("qna", qna);
		return "qna/writeQna";
	}

	// 글수정된 페이지로 이동
	@PostMapping("/update_qna")
	public String updateQna(Qna qna) {
		qnaService.updateQna(qna);
		
		return "redirect:/qna/qna_detail?qnano=" + qna.getQnano();
	}

	@GetMapping("/delete_qna")
	public String deleteQna(int qnano) {
		qnaService.deleteQna(qnano);
		return "redirect:/qna/qna_list";
	}

}
