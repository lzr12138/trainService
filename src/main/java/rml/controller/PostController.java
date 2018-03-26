package rml.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import rml.model.Comment;
import rml.model.Post;
import rml.model.Reply;
import rml.model.User;
import rml.service.MUserServiceI;
import rml.service.PostServiceI;

@Controller
@RequestMapping("/postController")
public class PostController {
	
	private PostServiceI postService;
	private MUserServiceI muserService;

	public PostServiceI getPostService() {
		return postService;
	}

	@Autowired
	public void setPostService(PostServiceI postService) {
		this.postService = postService;
	}
	
	public MUserServiceI getMuserService() {
		return muserService;
	}
	
	@Autowired
	public void setMuserService(MUserServiceI muserService) {
		this.muserService = muserService;
	}
	
	@RequestMapping(value="/allPost")
	public String allPost(String userid, HttpServletRequest request){
		User user = muserService.userDetail(userid);
		request.setAttribute("user", user);
		return"PostInfo";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/allPostlist",produces = "application/json;chgetAlarmStockListarset=UTF-8")
	@ResponseBody
	public Map<String, Object> allPostlist(@RequestParam Map<String,Object> map) throws IOException {
		int page = Integer.parseInt(String.valueOf(map.get("page")));
		int rows =  Integer.parseInt(String.valueOf(map.get("rows")));
		map.put("start", (page-1)*rows);//开始页
		map.put("end",rows);//结束页
		List<Post> list = postService.allPost(map);
		Map<String, Object> resultmap = new HashMap<String, Object>();
		int total = postService.getCount(map);
		resultmap.put("rows", list);
		resultmap.put("total",total);
		return resultmap;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/allPostforFirst",produces = "application/json;chgetAlarmStockListarset=UTF-8")
	@ResponseBody
	public Map<String, Object> postFirst(HttpServletRequest request) throws IOException {
		
		List<Post> list = postService.allPostforFirst();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", list.size());
		return map;
	}
	
	@RequestMapping(value="/PostDetail")
	public String postDetail(String postId, String userid, HttpServletRequest request){
		User user = new User();
		Post post = new Post();
		post = postService.selectPostByPostId(postId);
		List<Comment> comment = postService.selectCommentByPostId(postId);
		post.setClicknum(post.getClicknum()+1);
		postService.addClickNum(post);
		List<Map<String,Object>> commentlist = new ArrayList<Map<String, Object>>();
		for(int i=0; i<comment.size(); i++){
			Map<String,Object> map = new HashMap<String, Object>();
			List<Reply> replylist = postService.selectReplyByCommentId(comment.get(i).getId());
			map.put("comment", comment.get(i));
			map.put("reply", replylist);
			commentlist.add(map);
		}
		user = muserService.userDetail(userid);
		request.setAttribute("commentlist", commentlist);
		request.setAttribute("post", post);
		request.setAttribute("user", user);
		return "postDetail";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/userPost.do",produces = "application/json;chgetAlarmStockListarset=UTF-8")
	@ResponseBody
	public Map<String, Object> userPost(@RequestParam Map<String,Object> map,String publicUserId, HttpServletRequest request) throws IOException {
		int page = Integer.parseInt(String.valueOf(map.get("page")));
		int rows =  Integer.parseInt(String.valueOf(map.get("rows")));
		map.put("start", (page-1)*rows);//开始页
		map.put("end",rows);//结束页
		map.put("publicUserId", publicUserId);
		List<Post> list = postService.selectUserPost(map);
		int total = postService.getCountuser(map);
		Map<String, Object> resultmap = new HashMap<String, Object>();
		resultmap.put("rows", list);
		resultmap.put("total", total);
		return resultmap;
	}
	
	@RequestMapping(value="/publicPost")
	public String publicPost(Post post, HttpServletRequest request) {
		String id = UUID.randomUUID().toString();
		post.setId(id);
		post.setClicknum(0);
		postService.insertPost(post);
		return "redirect:/muserController/UserDetail.do?id="+post.getPublicUserId();
	}
	
	@RequestMapping(value="/publicComment")
	public String publicComment(Comment comment, String userid, HttpServletRequest request) {
		String id = UUID.randomUUID().toString();
		comment.setId(id);
		postService.insertComment(comment);
		return "redirect:/postController/PostDetail.do?postId="+comment.getPost_id()+"&&userid="+userid;
	}
	
	@RequestMapping(value="/publicReply")
	public String publicReply(Reply reply, String userid, String postid, HttpServletRequest request) {
		String id = UUID.randomUUID().toString();
		reply.setId(id);
		postService.insertReply(reply);
		return "redirect:/postController/PostDetail.do?postId="+postid+"&&userid="+userid;
	}
	
	@RequestMapping(value="/deletePost")
	public String deletePost(String id, String userid, HttpServletRequest request) {
		List<Comment> list = postService.selectCommentByPostId(id);
		for(int j=0; j<list.size();j++){
			String commentid = list.get(j).getId();
			postService.deleteReply(commentid);
		}
		postService.deleteComment(id);
		postService.deleteByPrimaryKey(id);
		return "redirect:/muserController/UserDetail.do?id="+userid;
	}
}
