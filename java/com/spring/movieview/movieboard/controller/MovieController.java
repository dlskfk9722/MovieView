package com.spring.movieview.movieboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.movieview.commons.PageCriteria;
import com.spring.movieview.commons.SearchCriteria;
import com.spring.movieview.movieboard.model.MovieUploadFileVO;
import com.spring.movieview.movieboard.model.MovieVO;
import com.spring.movieview.movieboard.service.IMovieService;
import com.spring.movieview.review.model.ReviewVO;
import com.spring.movieview.review.service.IReviewService;

@Controller
@RequestMapping(value="/movieboard")
public class MovieController {
	
	@Autowired
	private IMovieService service;
	
	@Autowired
	private IReviewService r_service;

	//목록조회
	/*@RequestMapping(value="/list", method=RequestMethod.GET)
	public String movieList(Model model) throws Exception {
		model.addAttribute("movielist", service.getAllList());
		return "/movieboard/list";
	}*/
	//목록조회(paging 처리, 검색처리)
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String movieList(Model model, SearchCriteria cri, String searchGenre, MovieVO movie) throws Exception{
		PageCriteria pc = new PageCriteria();
		pc.setCriteria(cri);
		System.out.println("테스트: "+service.countAll(cri));
		System.out.println("컨디션테스트: "+ cri.getCondition());
		System.out.println("키워드 테스트: "+cri.getKeyword());
		System.out.println("서치장르 생성자테스트: "+cri.getSearchGenre());
		pc.setArticleTotalCount(service.countAll(cri));
		if(searchGenre != null) {
		cri.setSearchGenre(searchGenre);
		}
		System.out.println("서치장르: "+cri.getSearchGenre());
		Map<String, Object> datas = new HashMap<>();
		datas.put("movieNo", movie.getMovieNo());
		datas.put("criteria", cri);
				
		model.addAttribute("movielist", service.getListPaging(datas));
		System.out.println("test : service.getlistpaging : "+ service.getListPaging(datas).toString());
		//model.addAttribute("movielist", service.getListPaging(cri));
		model.addAttribute("pageCri", pc);
		model.addAttribute("cri", cri);
		return "/movieboard/list";
	}
	
	
	//한가지 게시물 조회
	@RequestMapping(value="/content", method=RequestMethod.GET)
	public String oneList(Model model, int movieNo, SearchCriteria cri) throws Exception {
		MovieVO movie = service.getOneList(movieNo);
		model.addAttribute("movie", movie);
		cri.setCountPerPage(5);
		PageCriteria pc = new PageCriteria();
		pc.setCriteria(cri);
		System.out.println("크리확인: "+cri);
		pc.setArticleTotalCount(r_service.countSearchArticles(cri, movieNo));
		System.out.println("총게시물 수: "+r_service.countSearchArticles(cri, movieNo));
		System.out.println("리뷰컨디션: "+cri.getCondition()+", 리뷰키워드: "+cri.getKeyword());
		System.out.println("첫페이지: "+pc.getBeginPage()+", 막페이지: "+pc.getEndPage());
		List<ReviewVO> li = r_service.listSearch(cri, movieNo);
		
		System.out.println("검색결과: " + li);
		model.addAttribute("reviews", li);
		model.addAttribute("criteria", cri);
		model.addAttribute("pageCreator", pc);
		MovieUploadFileVO file = service.getFileByMovieNo(movie.getMovieNo());
		System.out.println("movieno : " + movie.getMovieNo());
		System.out.println("movie info : " + movie.toString());
	
		System.out.println("file정보: " + file);
		model.addAttribute("image", file);
		return "/movieboard/content";
	}
	//리뷰별점주기 
	@RequestMapping(value="/star", method=RequestMethod.POST)
	public String updateStar(ReviewVO review, RedirectAttributes redirectAttr) throws Exception{
		r_service.updateStar(review);
		redirectAttr.addFlashAttribute("message", "starSuccess");
		System.out.println("1리뷰점수: "+review.getStarSum()+", 리뷰사람수: "+review.getStarCnt()+", 리뷰넘버: "+review.getReviewNo());
		System.out.println(review);
		return "redirect:/movieboard/content?movieNo="+review.getMovieNo();
	}
	
	//작성폼
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insertForm() {
		return "/movieboard/insert";
	}
	//작성
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String movieInsert(MovieVO movie, RedirectAttributes redirectAttr) throws Exception {
		 System.out.println("movie정보 : " + movie.toString());
			MultipartFile mfile = movie.getFile();
			
			if(mfile != null && !mfile.isEmpty()) {
				MovieUploadFileVO file = new MovieUploadFileVO();
				
				file.setFileName(mfile.getOriginalFilename());
				file.setFileSize(mfile.getSize());
				file.setFileContentType(mfile.getContentType());
				file.setFileData(mfile.getBytes());
				
				System.out.println("file info: " + file);
				
				service.insert(movie, file);
				redirectAttr.addFlashAttribute("message", "insertSuccess");
			} else {
				service.insertMovie(movie);
				redirectAttr.addFlashAttribute("message", "insertSuccess");
				
			}
		return "redirect:/movieboard/list";
	}
	//삭제
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String movieDelete(int movieNo, RedirectAttributes redirectAttr) throws Exception{
		service.deleteMovie(movieNo);
		redirectAttr.addFlashAttribute("message", "delSuccess");
		return "redirect:/movieboard/list";
	}
	//수정폼
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String updateform(Model model, int movieNo) throws Exception{
		model.addAttribute("movie", service.getOneList(movieNo));
		return "/movieboard/update";
	}
	//수정
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String movieUpdate(MovieVO movie, RedirectAttributes redirectAttr) throws Exception{
		service.updateMovie(movie);
		redirectAttr.addFlashAttribute("message", "updateSuccess");
		return "redirect:/movieboard/list";
	}
	@RequestMapping("/file/{fileId}")
	public ResponseEntity<byte[]> getFile(@PathVariable int fileId) throws Exception{
			System.out.println("file정보검색 시작");
			MovieUploadFileVO file = service.getFile(fileId);
		
			System.out.println("file정보: " + file);
				
			HttpHeaders headers = new HttpHeaders();
			String[] ftypes = file.getFileContentType().split("/");
			headers.setContentType(new MediaType(ftypes[0], ftypes[1]));
			headers.setContentLength(file.getFileSize());
			headers.setContentDispositionFormData("attachment", file.getFileName());
			return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
	}
	
}
