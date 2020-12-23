package com.example.demo.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import com.example.config.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.service.BoardService;
import com.example.demo.vo.BoardVO;
import com.example.demo.vo.ManualVO;
import com.example.demo.vo.FWVO;
import com.example.demo.vo.BusVO;
//import com.example.demo.vo.Criteria;====
import com.example.demo.vo.PageMaker;
import com.example.demo.vo.SearchCriteria;
import org.springframework.web.servlet.ModelAndView;
// 엑셀관련 부분 
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.python.core.PyObject;
import org.python.util.PythonInterpreter;


@Controller
@CrossOrigin(origins = "*", allowedHeaders = "*")
//@RestController
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static PythonInterpreter intPre;
	@Inject
	BoardService service;

	// 게시판 글 작성 화면
	@RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
	public void writeView(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("writeView");
		model.addAttribute("csr_type", service.csr_type(scri));
		model.addAttribute("co_info", service.co_info(scri));
		model.addAttribute("csr_req", service.csr_req(scri));
		model.addAttribute("device", service.device(scri));
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
		return "redirect:/board/client04";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");
		
		model.addAttribute("comp", service.comp(scri));
		model.addAttribute("list", service.list(scri));
		model.addAttribute("co_info", service.co_info(scri));
		model.addAttribute("csr_req", service.csr_req(scri));
		model.addAttribute("user", service.user(scri));
		model.addAttribute("status", service.status(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));		

		model.addAttribute("pageMaker", pageMaker);

		return "board/list";

	}
	
	// 게시판 목록 조회
		@RequestMapping(value = "/anal", method ={RequestMethod.GET, RequestMethod.POST})
		public String anal(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
			logger.info("anal");
			
			model.addAttribute("comp", service.comp(scri));
			//List<BoardVO> comp=service.comp(scri);
			//System.out.println("comp control list :" +comp+"\n"  );
			//List<Map<String, Object>> anal1=service.anal1(scri);
			model.addAttribute("anal1", service.anal1(scri));			
			//System.out.println("anal1 control list :" +anal1+"\n"  );
			
			//List<Map<String, Object>> anal2=service.anal2(scri);
			model.addAttribute("anal2", service.anal2(scri));			
			//System.out.println("anal2 control list :" +anal2+"\n"  );
			
			//List<Map<String, Object>> tot=service.tot(scri);
			model.addAttribute("tot", service.tot(scri));			
			//System.out.println("tot control :" +tot+"\n"  );
			
			
			//System.out.println("anal :" +anal1+"\n"  );
			
			//List<Map<String, Object>> month=service.month(scri);
			model.addAttribute("month", service.month(scri));
			
			model.addAttribute("list", service.list(scri));
			model.addAttribute("co_info", service.co_info(scri));
			model.addAttribute("csr_req", service.csr_req(scri));
			model.addAttribute("user", service.user(scri));
			model.addAttribute("status", service.status(scri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));		

			model.addAttribute("pageMaker", pageMaker);

			return "board/anal";

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
		//System.out.println("fileList :" +fileList+"\n"  );
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

		service.update(vo, files, fileNames ,mpRequest);

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
	
	// 처리대분류 조회
	@RequestMapping(value = "/car_region", method = RequestMethod.GET)
	public String car_region(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("car_region");


			model.addAttribute("car_region", service.car_region(scri));

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
		model.addAttribute("csr_req", service.csr_req(scri));
		
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
	
	// 등록내역 엑셀출력
	@RequestMapping(value = "/selRe", method = RequestMethod.GET)
	public String selRe(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		 
		logger.info("selRe");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
	
		return "board/selRe";
		//return "board/writeView";
	}
	
	// 등록내역 엑셀출력
	@RequestMapping(value = "/selanal", method = {RequestMethod.GET, RequestMethod.POST})
	public String selanal(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
			 
		logger.info("selanal");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		return "board/selanal";
			//return "board/writeView";
	}
	
	// 메뉴얼 등록 작성 화면
	@RequestMapping(value = "/board/manualwriteView", method = RequestMethod.GET)
	public void manualwriteView(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("manualwriteView");

	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/board/manualwrite", method = RequestMethod.POST)
	public String manualwrite(ManualVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("manualwrite");

		service.manualwrite(vo, mpRequest);

		return "redirect:/board/manuallist";
	}
	
	
	// 게시판 목록 조회
	@RequestMapping(value = "/manuallist", method = RequestMethod.GET)
	public String manuallist(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("manuallist");

		model.addAttribute("manuallist", service.manuallist(scri));		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.manuallistCount(scri));		

		model.addAttribute("pageMaker", pageMaker);

		return "board/manuallist";

	}	
	
	// 메뉴얼 등록내역 조회
	@RequestMapping(value = "/manualreadView", method = RequestMethod.GET)
	public String manualread(ManualVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("manualread");

		model.addAttribute("manualread", service.manualread(vo.getMno()));
		
		List<Map<String, Object>> manualfileList = service.manualselectFileList(vo.getMno());
		model.addAttribute("manualfile", manualfileList);
		//System.out.println("man List :" +manualfileList+"\n"  );
		return "board/manualreadView";
	}
	
	//메뉴얼 다운로드
	@RequestMapping(value="/mfileDown")
	public void mfileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = service.manselectFileInfo(map);
		String storedFileName = (String) resultMap.get("mSTORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("mORG_FILE_NAME");
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("/home/bliss/manual/"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	
	// 메뉴얼 등록 수정뷰
		@RequestMapping(value = "/manupdateView", method = RequestMethod.GET)
		public String manupdateView(ManualVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
			logger.info("updateView");

			model.addAttribute("manupdate", service.manualread(vo.getMno()));			
			
			List<Map<String, Object>> manualfileList = service.manualselectFileList(vo.getMno());
			model.addAttribute("manualfile", manualfileList);
			return "board/manupdateView";
		}

	// 게시판 수정
	@RequestMapping(value = "/manupdate", method = RequestMethod.POST)
	public String manupdate(ManualVO vo, @ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr, 
			@RequestParam(value="mfileNoDel[]") String[] files,
			@RequestParam(value="mfileNameDel[]") String[] fileNames,
			MultipartHttpServletRequest mpRequest) throws Exception {
			logger.info("manupdate");

			service.manupdate(vo, files, fileNames ,mpRequest);

			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/manuallist";
	}
	
	// 메뉴얼 삭제
	@RequestMapping(value = "/mandelete", method = RequestMethod.POST)
	public String mandelete(ManualVO vo,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
	
		logger.info("mandelete");

		service.mandelete(vo.getMno());

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/manuallist";
	}
	
	// tts
	@RequestMapping(value = "/tts", method = {RequestMethod.GET, RequestMethod.POST})
	public void tts() throws Exception{
	
		logger.info("tts");

		
	}
	
	// tts 합성관련
	@RequestMapping(value = "/synthesizeWorker", method = {RequestMethod.GET, RequestMethod.POST})
	public String tts_synthesizeWorker() throws Exception{
	
		logger.info("tts");
		return "redirect:/board/tts";
		
	}
	
	// 다음지도
	@RequestMapping(value = "/map", method = {RequestMethod.GET, RequestMethod.POST})
	public void map() throws Exception{
	
		logger.info("map");		
		
	}
	
	// 메시지
		@RequestMapping(value = "/board/message", method = {RequestMethod.GET, RequestMethod.POST})
		public void message() throws Exception{
		
			logger.info("message");		
			
	}
	
	// ocr
		@RequestMapping(value = "/ocr", method = {RequestMethod.GET, RequestMethod.POST})
		public void ocr(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
			logger.info("OCR 화면");
			model.addAttribute("co_info", service.co_info(scri));
			model.addAttribute("car_region", service.car_region(scri));
			model.addAttribute("bus_type", service.bus_type(scri));
		/*	String pythonScriptPath = "C:\\WebWorkspace\\chatbot\\src\\main\\resources\\static\\js\\restapi.py";
			String[] cmd = new String[2];
			cmd[0] = "python";
			cmd[1] = pythonScriptPath;						
			
			Runtime rt = Runtime.getRuntime();
			Process process = rt.exec(cmd);
			logger.info("ocr");		
			*/
			
			
		}

	
	// F/W 등록 작성 화면
	@RequestMapping(value = "/board/FWwriteView", method = RequestMethod.GET)
	public void FWwriteView(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("FWwriteView");

	}
		
	// F/W 글 작성
	@RequestMapping(value = "/board/FWwrite", method = RequestMethod.POST)
	public String FWwrite(FWVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("FWwrite");

		service.FWwrite(vo, mpRequest);

		return "redirect:/board/FWlist";
	}
		
		
	// F/W 목록 조회
	@RequestMapping(value = "/FWlist", method = RequestMethod.GET)
	public String FWlist(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("FWlist");
		model.addAttribute("FWlist", service.FWlist(scri));		
			
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.FWlistCount(scri));		
			model.addAttribute("pageMaker", pageMaker);
			return "board/FWlist";
	}	
		
	// F/W 등록내역 조회
	@RequestMapping(value = "/FWreadView", method = RequestMethod.GET)
	public String FWread(FWVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("FWread");

			model.addAttribute("FWread", service.FWread(vo.getFno()));
			
			List<Map<String, Object>> FWfileList = service.FWselectFileList(vo.getFno());
			
			model.addAttribute("FWfile", FWfileList);
			//System.out.println("FW List :" +FWfileList+"\n"  );
			
			return "board/FWreadView";
	}
		
	//F/W 다운로드
	@RequestMapping(value="/ffileDown")
	public void ffileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = service.FWselectFileInfo(map);
		String storedFileName = (String) resultMap.get("fSTORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("fORG_FILE_NAME");
			
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("/home/bliss/FW/"+storedFileName));
			
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
			
	}
		
	// F/W 등록 수정뷰
	@RequestMapping(value = "/FWupdateView", method = RequestMethod.GET)
	public String FWupdateView(FWVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
				logger.info("FWupdateView");

				model.addAttribute("FWupdate", service.FWread(vo.getFno()));			
				
				List<Map<String, Object>> FWfileList = service.FWselectFileList(vo.getFno());
				model.addAttribute("FWfile", FWfileList);
				return "board/FWupdateView";
	}

	// F/W 게시판 수정
	@RequestMapping(value = "/FWupdate", method = RequestMethod.POST)
	public String FWupdate(FWVO vo, @ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr, 
			@RequestParam(value="ffileNoDel[]") String[] files,
			@RequestParam(value="ffileNameDel[]") String[] fileNames,
			MultipartHttpServletRequest mpRequest) throws Exception {
			logger.info("FWupdate");

			service.FWupdate(vo, files, fileNames ,mpRequest);

				rttr.addAttribute("page", scri.getPage());
				rttr.addAttribute("perPageNum", scri.getPerPageNum());
				rttr.addAttribute("searchType", scri.getSearchType());
				rttr.addAttribute("keyword", scri.getKeyword());
				
				return "redirect:/board/FWlist";
	}
		
	// F/W 삭제
	@RequestMapping(value = "/FWdelete", method = RequestMethod.POST)
	public String FWdelete(FWVO vo,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		
			logger.info("FWdelete");

			service.FWdelete(vo.getFno());

			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/FWlist";
	}
	
	@SuppressWarnings("null")
	@RequestMapping(value = "/excelDown")

	public void excelDown(Model model, HttpServletResponse response, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		logger.info("REPORT-EXCEL");
	    // 게시판 목록조회
	    List<BoardVO> list = service.listtotal(scri);

	

	    // 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("장애총괄현황");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0; 
	    


	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();
	    // 가는 경계선을 가집니다.
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);


	    // 배경색은 노란색입니다.
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);



	    // 데이터는 가운데 정렬합니다.
	    headStyle.setAlignment(HorizontalAlignment.CENTER);


	    // 데이터용 경계 스타일 테두리만 지정
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);



	    // 헤더 생성
	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("일자");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("월");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("접수구분");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("처리지역");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("처리거점");
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("고속사");
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("차량번호");
	    cell = row.createCell(7);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("단말기 ");
	    cell = row.createCell(8);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("장애대분류 ");
	    cell = row.createCell(9);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("처리대분류 ");
	    cell = row.createCell(10);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("장애접수내용 ");
	    cell = row.createCell(11);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("세부조치내용 ");
	    cell = row.createCell(12);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("비고 ");
	    cell = row.createCell(13);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("처리담당자 ");
	    cell = row.createCell(14);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("교체전");
	    cell = row.createCell(15);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("교체후");
	    cell = row.createCell(16);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("GPS 안테나 ");
	    cell = row.createCell(17);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("AUDIO 케이블 ");
	    cell = row.createCell(18);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("VIDEO 케이블 ");
	    cell = row.createCell(19);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("행선 케이블 ");
	    cell = row.createCell(20);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("Y케이블");
	    cell = row.createCell(21);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("AFC 케이블 ");
	    cell = row.createCell(22);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("BMS 케이블");
	    cell = row.createCell(23);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("젠더(AUDIO)");
	    cell = row.createCell(24);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("쿠션");
	    cell = row.createCell(25);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("LTE,Wifi 안테나");
	    cell = row.createCell(26);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("심지봉");
	    cell = row.createCell(27);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("육각볼트(와셔포함)");
	    cell = row.createCell(28);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("베이스 플레이트 ");
	    
	    // 데이터 부분 생성

	    for(BoardVO vo : list) {
	        row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getDate());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        //String to Date 변환
	        Date date = vo.getRegdate();
	        DateFormat format = new SimpleDateFormat("MM월");
	        String datestr = format.format(date);        
	        cell.setCellValue(datestr);
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getCsr_type());
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getFix_area());
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getZone());
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getCo_nm());
	        cell = row.createCell(6);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getCar_no());
	        cell = row.createCell(7);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getDevice());
	        cell = row.createCell(8);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getCsr_req());
	        cell = row.createCell(9);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getFix_ctg());
	        cell = row.createCell(10);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getCsr_cont());
	        cell = row.createCell(11);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getFix_cont());
	        cell = row.createCell(12);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getEtc());
	        cell = row.createCell(13);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getUser());
	        cell = row.createCell(14);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getBe_ih());
	        cell = row.createCell(15);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getAf_ih());
	        cell = row.createCell(16);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getGps_ant());
	        cell = row.createCell(17);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getAudio_cab());
	        cell = row.createCell(18);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getVideo_cab());
	        cell = row.createCell(19);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getLed_cab());
	        cell = row.createCell(20);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getY_cab());
	        cell = row.createCell(21);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getAfc_cab());
	        cell = row.createCell(22);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getBms_cab());
	        cell = row.createCell(23);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getAudio_gender());
	        cell = row.createCell(24);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getCushion());
	        cell = row.createCell(25);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getLte_ant());
	        cell = row.createCell(26);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getPrint_bar());
	        cell = row.createCell(27);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getHexbolt());
	        cell = row.createCell(28);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getBaseplate());
	        
	    }
	    
	    for (int i=0;i<30;i++) //autuSizeColumn after setColumnWidth setting!!
	    {
	    sheet.autoSizeColumn(i);
	    sheet.setColumnWidth(i, (sheet.getColumnWidth(i))+512 ); //이건 자동으로 조절 하면 너무 딱딱해 보여서 자동조정한 사이즈에 (short)512를 추가해 주니 한결 보기 나아졌다.
	    }

	    row.setHeight((short)512);

	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=Report.xls");


	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();
	    logger.info("시마이");
	}
	
	// 가베 결제 선택화면
	//@RequestMapping(value = "/client04", method = RequestMethod.GET)
	@RequestMapping(value = "/pay", method = {RequestMethod.GET, RequestMethod.POST})
	public void pay(BoardVO vo, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		 
		logger.info("pay");	
		
		//return "board/client04";
	}
	
	// 결제 진행화면
	@RequestMapping(value = "/prepare", method = {RequestMethod.GET, RequestMethod.POST})
	public void prepare(BoardVO vo, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
			 
		logger.info("prepare");	
			
			//return "board/client04";
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