package rml.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rml.dao.PostMapper;
import rml.model.Comment;
import rml.model.Post;
import rml.model.Reply;

@Service("postService")
public class PostServiceImpl implements PostServiceI{
	
	private PostMapper postMapper;

	public PostMapper getPostMapper() {
		return postMapper;
	}
	
	@Autowired
	public void setPostMapper(PostMapper postMapper) {
		this.postMapper = postMapper;
	}

	@Override
	public List<Post> allPost(Map<String,Object> map) {
		return postMapper.allPost(map);
	}

	@Override
	public Post selectPostByPostId(String postId) {
		return postMapper.selectPostByPostId(postId);
	}

	@Override
	public List<Comment> selectCommentByPostId(String postId) {
		return postMapper.selectCommentByPostId(postId);
	}

	@Override
	public List<Reply> selectReplyByCommentId(String commentid) {
		return postMapper.selectReplyByCommentId(commentid);
	}

	@Override
	public List<Post> selectUserPost(Map<String,Object> map) {
		return postMapper.selectUserPost(map);
	}

	@Override
	public int insertPost(Post post) {
		return postMapper.insertPost(post);
	}

	@Override
	public int insertComment(Comment comment) {
		return postMapper.insertComment(comment);
	}

	@Override
	public int insertReply(Reply reply) {
		return postMapper.insertReply(reply);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		return postMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteComment(String postid) {
		return postMapper.deleteComment(postid);
	}

	@Override
	public int deleteReply(String commentid) {
		return postMapper.deleteReply(commentid);
	}

	@Override
	public List<Post> allPostforFirst() {
		return postMapper.allPostforFirst();
	}

	@Override
	public int addClickNum(Post post) {
		return postMapper.addClickNum(post);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return postMapper.getCount(map);
	}

	@Override
	public int getCountuser(Map<String, Object> map) {
		return postMapper.getCountuser(map);
	}
	

}
