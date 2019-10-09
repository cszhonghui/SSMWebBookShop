package com.imu.jk.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.imu.jk.bean.Book;
import com.imu.jk.bean.Comment;
import com.imu.jk.bean.History;
import com.imu.jk.bean.User;
import com.imu.jk.service.BookService;
import com.imu.jk.service.BookTypeService;
import com.imu.jk.service.CommentService;
import com.imu.jk.service.HistoryService;


@Controller
@RequestMapping("/Book")
public class BookController {
	
	@Autowired
	private BookService bookService;
	@Autowired
	private HistoryService hisService;
	@Autowired
	private BookTypeService bookTypeService;
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/uploadPic")
	@ResponseBody
	public String uploadPic(@RequestParam MultipartFile bpicfile,HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("images/product");  

        String fileName = bpicfile.getOriginalFilename();   

        File dir = new File(path,fileName);    
        
        if(!dir.exists()){  
            dir.mkdirs();  
        }  
       
        try {
        	bpicfile.transferTo(dir);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "false";
		} 
		return "success";
	}
	
	
	
	
	
	
	@RequestMapping("/bookSearch")
	public String bookSearch(Model model,HttpSession session,String key,Integer pageIndex,Integer pageSize){
		
		pageIndex=pageIndex==null?1:pageIndex;
		pageSize=pageSize==null?5:pageSize;
		model.addAttribute("pageIndex",pageIndex);
		model.addAttribute("pageSize", pageSize);		
		model.addAttribute("totalPage", bookService.getTotalPagesBySearch(key, pageSize));		

		model.addAttribute("booktypes", bookTypeService.queryBookTypes());
		model.addAttribute("books", bookService.queryBookBySearch(key, pageIndex, pageSize));
		model.addAttribute("keyword",key);
		
		User user=(User)session.getAttribute("user");
		if(user==null)
			return "front/booklist";
		model.addAttribute("histories", hisService.queryHisByUid(user.getUid()));
		return "front/booklist";
	}
	
	@RequestMapping("/bookList")
	public String booktListPage(Model model,HttpSession session,Integer btid,Integer pageIndex,Integer pageSize){
		
		pageIndex=pageIndex==null?1:pageIndex;
		pageSize=pageSize==null?5:pageSize;
		model.addAttribute("pageIndex",pageIndex);
		model.addAttribute("pageSize", pageSize);		
		model.addAttribute("totalPage", bookService.getTotalRowByBtid(btid, pageSize));		
		
		model.addAttribute("sel_btid", btid);
		

		model.addAttribute("booktypes", bookTypeService.queryBookTypes());
		model.addAttribute("books", bookService.queryBookByBtid(btid, pageIndex, pageSize));
		
		User user=(User)session.getAttribute("user");
		if(user==null)
			return "front/booklist";
		model.addAttribute("histories", hisService.queryHisByUid(user.getUid()));
		return "front/booklist";
	}
	
	@RequestMapping("/index")
	public String Indexjsp(Model model,HttpSession session){
		model.addAttribute("books",bookService.queryBook());

		model.addAttribute("booktypes", bookTypeService.queryBookTypes());
		User user=(User)session.getAttribute("user");
		if(user==null)
			return "front/index";		
			model.addAttribute("histories", hisService.queryHisByUid(user.getUid()));
		return "front/index";

	}
	
	@RequestMapping("/bookDetail")
	public String showBookDetail(Model model,HttpSession session,Integer bid,Integer pageIndex,Integer pageSize){
		model.addAttribute("books",bookService.queryBook());

		model.addAttribute("book", bookService.queryBookById(bid));
		model.addAttribute("booktypes", bookTypeService.queryBookTypes());
		
		pageIndex=pageIndex==null?1:pageIndex;
		pageSize=pageSize==null?5:pageSize;		
		model.addAttribute("pageIndex",pageIndex);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPage", commentService.getTotalPages(bid, pageSize));
		
		model.addAttribute("comments", commentService.getCommentByBookId(bid,pageIndex,pageSize));		
		
		User user=(User) session.getAttribute("user");
		if(user==null)
			return "front/bookdetail";	
		History history=new History();
		Book book=new Book();
		book.setBid(bid);
		history.setBook(book);
		history.setUser(user);
		hisService.addHistory(history);
		model.addAttribute("histories", hisService.queryHisByUid(user.getUid()));
		return "front/bookdetail";
	}

	@RequestMapping("/productAddPage")
	public String productAddPage(HttpSession session,Model model){
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		model.addAttribute("bts", bookTypeService.queryBookTypes());
		return "manage/product-add";
	}
	
	@RequestMapping("/productAddAction")
	public String productAddAction(HttpSession session,Book book,HttpServletRequest request){
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		bookService.addBook(book);
		return "redirect:showProductPage";
	}
	@RequestMapping("/productModifyPage")
		public String productModifyPage(Model model,Integer bid){

		model.addAttribute("book", bookService.queryBookById(bid));
		model.addAttribute("bts", bookTypeService.queryBookTypes());		
		return "manage/product-modify";
	}	
	@RequestMapping("/productModifyAction")
	public String productModifyAction(HttpSession session,Book book,HttpServletRequest request){

    		
		System.out.println("********\n"+book+"*********\n");
		
		
		
		
		bookService.modify(book);
		return "redirect:showProductPage";
	}
	
	@RequestMapping("/addCommentPage")
	public String productModifyAction(Model model,Integer bid,Integer uid,String onumber){
		model.addAttribute("book",bookService.queryBookById(bid));
		model.addAttribute("uid",uid);
		model.addAttribute("onumber",onumber);
		return "front/comment";
	}

	
	@RequestMapping("/addCommentAction")
	public String addCommentAction(Comment comment,String onumber){
		commentService.makeComm(comment);
		
		return "redirect:/OrderDetail/updateCom?onumber="+onumber+"&bid="+comment.getBook().getBid();
	}
	
	
	
	@RequestMapping("/deleteProduct")
	public String deleteProduct(HttpSession session,Integer bid){
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		bookService.remove(bid);
		return "redirect:showProductPage";
	}	
	
	
	@RequestMapping("/showProductPage")
	public String showProductPage(HttpSession session,Model model,Integer pageIndex,Integer pageSize){
		if(session.getAttribute("admin")==null)return "redirect:/backlogin";
		pageIndex=pageIndex==null?1:pageIndex;
		pageSize=pageSize==null?5:pageSize;		
		model.addAttribute("pageIndex",pageIndex);
		model.addAttribute("totalPage", bookService.getTotalPages(pageSize));	
		model.addAttribute("pageSize", pageSize);		
		model.addAttribute("books",bookService.pagination(pageIndex, pageSize));
		return "manage/product";
	}	
	

}
