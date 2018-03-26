package rml.service;

import java.util.List;
import java.util.Map;

import rml.model.Comment;
import rml.model.Post;
import rml.model.Reply;

public interface PostServiceI {
	
	List<Post> allPost(Map<String,Object> map);
	
	int getCount(Map<String, Object> map);
	
	List<Post> allPostforFirst();
	
	Post selectPostByPostId(String postId);
	
	List<Comment> selectCommentByPostId(String postId);
	
	List<Reply> selectReplyByCommentId(String commentid);
	
	List<Post> selectUserPost(Map<String,Object> map);
	
	int getCountuser(Map<String,Object> map);
	
	int insertPost(Post post);
	
	int insertComment(Comment comment);
	
	int insertReply(Reply reply);
	
	int deleteByPrimaryKey(String id);
	
	int deleteComment(String postid);
	
	int deleteReply(String commentid);
	
	int addClickNum(Post post);
	
}
