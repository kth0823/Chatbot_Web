package com.example.demo.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.service.BoardService;
import com.example.demo.vo.BoardVO;
//import com.example.demo.vo.Criteria;====
import com.example.demo.vo.PageMaker;
import com.example.demo.vo.SearchCriteria;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	BoardService service;

	// 게시판 글 작성 화면
	@RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
	public void writeView(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("writeView");
		model.addAttribute("csr_type", service.csr_type(scri));
		model.addAttribute("co_info", service.co_info(scri));
		model.addAttribute("csr_req", service.csr_req(scri));
		model.addAttribute("fix_area", service.fix_area(scri));
		model.addAttribute("zone", service.zone(scri));
		model.addAttribute("co_info", service.co_info(scri));
		model.addAttribute("user", service.user(scri));	
		model.addAttribute("status", service.status(scri));
		model.addAttribute("fix_ctg", service.fix_ctg(scri));
		model.addAttribute("simple", service.simple(scri));
	}

	// 게시판 글 작성
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String write(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("write");

		service.write(vo, mpRequest);

		return "redirect:/board/list";
	}
	
	// 챗봇 글 작성
	@RequestMapping(value = "/board/writechat", method = RequestMethod.POST)
	public String writechat(BoardVO vo) throws Exception {
		logger.info("writechat");

		service.writechat(vo);
		Thread.sleep(4000);
		return "redirect:/board/client04";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");

		model.addAttribute("list", service.list(scri));
		model.addAttribute("csr_req", service.csr_req(scri));
		model.addAttribute("user", service.user(scri));
		model.addAttribute("status", service.status(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));		

		model.addAttribute("pageMaker", pageMaker);

		return "board/list";

	}
	
	// 챗봇 등록 목록 조회
	@RequestMapping(value = "/list2", method = RequestMethod.GET)
	public String list2(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list2");

		model.addAttribute("list2", service.list2(scri));
		model.addAttribute("co_info", service.co_info(scri));
		model.addAttribute("csr_req", service.csr_req(scri));
		
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount2(scri));
		model.addAttribute("pageMaker", pageMaker);

		return "board/list2";

	}

	// 게시판 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BoardVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("read");

		model.addAttribute("read", service.read(vo.getBno()));

		model.addAttribute("scri", scri);
		model.addAttribute("csr_type", service.csr_type(scri));
		model.addAttribute("co_info", service.co_info(scri));
		model.addAttribute("csr_req", service.csr_req(scri));
		model.addAttribute("fix_area", service.fix_area(scri));
		model.addAttribute("zone", service.zone(scri));
		model.addAttribute("device", service.device(scri));
		model.addAttribute("user", service.user(scri));
		model.addAttribute("status", service.status(scri));
		model.addAttribute("fix_ctg", service.fix_ctg(scri));
		model.addAttribute("simple", service.simple(scri));
		List<Map<String, Object>> fileList = service.selectFileList(vo.getBno());
		model.addAttribute("file", fileList);
		return "board/readView";
	}
//
	// 게시판 수정뷰
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("updateView");

		model.addAttribute("update", service.read(vo.getBno()));
		model.addAttribute("scri", scri);
		model.addAttribute("csr_type", service.csr_type(scri));
		model.addAttribute("co_info", service.co_info(scri));
		model.addAttribute("csr_req", service.csr_req(scri));
		model.addAttribute("fix_area", service.fix_area(scri));
		model.addAttribute("zone", service.zone(scri));
		model.addAttribute("device", service.device(scri));
		model.addAttribute("user", service.user(scri));
		model.addAttribute("status", service.status(scri));
		model.addAttribute("fix_ctg", service.fix_ctg(scri));
		model.addAttribute("simple", service.simple(scri));
		List<Map<String, Object>> fileList = service.selectFileList(vo.getBno());
		model.addAttribute("file", fileList);
		return "board/updateView";
	}

	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO vo, @ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr, 
				@RequestParam(value="fileNoDel[]") String[] files,
			 @RequestParam(value="fileNameDel[]") String[] fileNames,
			 MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("update");

		service.update(vo);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}

	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardVO vo,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
	
		logger.info("delete");

		service.delete(vo.getBno());

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("/home/bliss/ref_file/"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	// 고속사 목록 조회
	@RequestMapping(value = "/co_info", method = RequestMethod.GET)
	public String co_info(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("co_info");


		model.addAttribute("co_info", service.co_info(scri));

		return "board/co_info";
		//return "board/writeView";

	}
	
	// 장애대분류 목록 조회
	@RequestMapping(value = "/csr_req", method = RequestMethod.GET)
	public String csr_req(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("csr_req");


		model.addAttribute("csr_req", service.csr_req(scri));

		return "board/csr_req";
		//return "board/writeView";

	}
	
	// 요청지역 목록 조회
	@RequestMapping(value = "/fix_area", method = RequestMethod.GET)
	public String fix_area(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("fix_area");


		model.addAttribute("fix_area", service.fix_area(scri));

		return "board/fix_area";
		//return "board/writeView";

	}
	
	// 처리지역 목록 조회
	@RequestMapping(value = "/zone", method = RequestMethod.GET)
	public String zone(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("zone");


		model.addAttribute("zone", service.zone(scri));

		return "board/zone";
		//return "board/writeView";

	}
	
	// 처리 단말기 품목 목록 조회
	@RequestMapping(value = "/device", method = RequestMethod.GET)
	public String device(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("device");


		model.addAttribute("device", service.device(scri));

		return "board/device";
		//return "board/writeView";

	}
	
	// 처리 단말기 품목 목록 조회
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String user(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("user");


		model.addAttribute("user", service.user(scri));

		return "board/user";
		//return "board/writeView";

	}
	
	// 접수상태 조회
	@RequestMapping(value = "/status", method = RequestMethod.GET)
	public String status(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("status");


		model.addAttribute("status", service.status(scri));

		return "board/status";
		//return "board/writeView";

	}
	// 접수구분 조회
	@RequestMapping(value = "/csr_type", method = RequestMethod.GET)
	public String csr_type(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("csr_type");


		model.addAttribute("csr_type", service.csr_type(scri));

		return "board/csr_type";
		//return "board/writeView";

	}
	// 처리대분류 조회
	@RequestMapping(value = "/fix_ctg", method = RequestMethod.GET)
	public String fix_ctg(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("fix_ctg");


		model.addAttribute("fix_ctg", service.fix_ctg(scri));

		return "board/fix_ctg";
		//return "board/writeView";
	}
	// 처리대분류 조회
	@RequestMapping(value = "/simple", method = RequestMethod.GET)
	public String simple(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("simple");


		model.addAttribute("simple", service.simple(scri));

		return "board/simple";
		//return "board/writeView";
	}
	// 챗봇 등록화면
	//@RequestMapping(value = "/client04", method = RequestMethod.GET)
	@RequestMapping(value = "/client04", method = {RequestMethod.GET, RequestMethod.POST})
	public void client(BoardVO vo, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		 mav.addObject("img", "./images/ATECTN.png");
		 
		logger.info("client04");
		
		
		
		
		model.addAttribute("co_info", service.co_info(scri));
		model.addAttribute("device", service.device(scri));
		
		//return "board/client04";
	}
	// 챗봇 조회화면
	@RequestMapping(value = "/client05", method = RequestMethod.GET)
	public String client2(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		 mav.addObject("img", "./images/ATECTN.png");
		 
		logger.info("client05");
		
		model.addAttribute("co_info", service.co_info(scri));
		model.addAttribute("device", service.device(scri));
		
		model.addAttribute("list", service.list(scri));
		model.addAttribute("csr_req", service.csr_req(scri));
		model.addAttribute("user", service.user(scri));
		model.addAttribute("status", service.status(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));		

		model.addAttribute("pageMaker", pageMaker);

		return "board/client05";
		//return "board/writeView";
	}
		
//		// 게시판 수정뷰
//		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
//		public String updateView(BoardVO vo, Model model) throws Exception{
//			logger.info("updateView");
//			
//			model.addAttribute("update", service.read(vo.getBno()));
//			
//			return "board/updateView";
//		}
//		
//		// 게시판 수정
//		@RequestMapping(value = "/update", method = RequestMethod.POST)
//		public String update(BoardVO vo) throws Exception{
//			logger.info("update");
//			
//			service.update(vo);
//			
//			return "redirect:/board/list";
//		}
//
//		// 게시판 삭제
//		@RequestMapping(value = "/delete", method = RequestMethod.POST)
//		public String delete(BoardVO vo) throws Exception{
//			logger.info("delete");
//			
//			service.delete(vo.getBno());
//			return "redirect:/board/list";
//		}			
}