package book.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import book.dto.BookDto;
import book.mapper.BookMapperInter;

@Controller
public class BookCotroller {

	
	@Autowired
	BookMapperInter bmapper;
	
	@GetMapping("/")
	public String start()
	{
		
		return"redirect:book/list";
	}
	
	
	 @GetMapping("/book/form")
	   public String form()
	   {
	      return "bookaddform";
	   }
	
	
	
	@GetMapping("/book/list")
	public ModelAndView list()
	
	{
		ModelAndView mview =new ModelAndView();
		
		int totbooks= bmapper.Totbook();
		
		
		//list
	      List<BookDto> list = bmapper.getAllData();
	      
	      mview.addObject("list", list);

		mview.addObject("totbooks", totbooks);
		mview.setViewName("booklist");
		
		
		return mview;
	}
	@PostMapping("/book/insert")
	public String insert(@ModelAttribute BookDto dto,@RequestParam MultipartFile photo, HttpSession session)
	{
		 //업로드 경로구하기
	      String path = session.getServletContext().getRealPath("/upload");   
	      System.out.println(path);
	      
	      if(photo.getOriginalFilename().equals(""))	
	         dto.setBookphoto(null);
	      else {
	         //사진명 구해서 넣기
	    	  String photoname=photo.getOriginalFilename();
	          dto.setBookphoto(photoname);

	         
	       
	         
	         //실제 업로드
	         try {
	            photo.transferTo(new File(path + "\\" + photoname));
	         } catch (IllegalStateException | IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	      }
	      
	      //db에 저장
	      bmapper.insertbook(dto);
	      
	      
	      return "redirect:list";
	}
	
	
}
