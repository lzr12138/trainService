package rml.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rml.dao.GoodsMapper;
import rml.model.CostInfo;
import rml.model.Goods;
import rml.model.Goods_comment;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsServiceI {
	
	private GoodsMapper goodsMapper;

	public GoodsMapper getGoodsMapper() {
		return goodsMapper;
	}
	
	@Autowired
	public void setGoodsMapper(GoodsMapper goodsMapper) {
		this.goodsMapper = goodsMapper;
	}

	@Override
	public List<Goods> allGoods(Map<String,Object> map) {
		return goodsMapper.allGoods(map);
	}

	@Override
	public List<Goods> allGoodsforFirst() {
		return goodsMapper.allGoodsforFirst();
	}

	@Override
	public Goods selectGoodsByGoodsId(String goodsId) {
		return goodsMapper.selectGoodsByGoodsId(goodsId);
	}

	@Override
	public List<Goods_comment> selectCommentByGoodsId(String goodsid) {
		return goodsMapper.selectCommentByGoodsId(goodsid);
	}

	@Override
	public int insertComment(Goods_comment goods_comment) {
		return goodsMapper.insertComment(goods_comment);
	}

	@Override
	public int buyGoods(CostInfo costinfo) {
		return goodsMapper.buyGoods(costinfo);
	}

	@Override
	public int updateGoods(Goods goods) {
		return goodsMapper.updateGoods(goods);
	}

	@Override
	public List<CostInfo> selectUserCost(Map<String,Object> map) {
		return goodsMapper.selectUserCost(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return goodsMapper.getCount(map);
	}

	@Override
	public void deleteCommentByGoodsId(String id) {
		goodsMapper.deleteCommentByGoodsId(id);
	}

	@Override
	public void deleteGoodsById(String id) {
		goodsMapper.deleteGoodsById(id);
	}

	@Override
	public void insertGoods(Goods goods) {
		goodsMapper.insertGoods(goods);
	}

	@Override
	public int getCountuser(Map<String, Object> map) {
		return goodsMapper.getCountuser(map);
	}

}
