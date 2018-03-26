package rml.dao;

import java.util.List;
import java.util.Map;

import rml.model.CostInfo;
import rml.model.Goods;
import rml.model.Goods_comment;

public interface GoodsMapper {
	
	List<Goods> allGoods(Map<String,Object> map);
	
	int getCount(Map<String ,Object> map);
	
	List<Goods> allGoodsforFirst();
	
	Goods selectGoodsByGoodsId(String goodsId);
	
	List<Goods_comment> selectCommentByGoodsId(String goodsid);
	
	int insertComment(Goods_comment goods_comment);
	
	int buyGoods(CostInfo costinfo);
	
	int updateGoods(Goods goods);
	
	List<CostInfo> selectUserCost(Map<String,Object> map);
	
	int getCountuser(Map<String,Object> map);
	
	void deleteCommentByGoodsId(String id);
	
	void deleteGoodsById(String id);
	
	void insertGoods(Goods goods);
	

}
