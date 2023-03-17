package kr.co.mirak.pay.chart;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mirak.pay.PayVO;

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ChartServiceImpl() {
	}

	public ChartServiceImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<PayVO> list() {

		ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);
		List<PayVO> list = mapper.list();

		return list;
	}

	@Override
	public int statUpdate(PayVO vo) {
		ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);
		int result = mapper.statUpdate(vo);

		return result;
	}

	@Override
	public Map<String, List<Object>> getTotalByMenuList(TotalByMenuVO vo) {
	    ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);

	    List<Double> totalPrice = new ArrayList<>();
	    List<String> pro_name = new ArrayList<>();

	    List<TotalByMenuVO> totalByMenuList = mapper.getTotalByMenuList(vo);
	    System.out.println(totalByMenuList);
	    for (TotalByMenuVO item : totalByMenuList) {
	    	totalPrice.add((double) item.getTotalPrice());
	        pro_name.add(item.getPro_name());
	    }
	    
	    Map<String, List<Object>> map = new HashMap<>();
	    map.put("totalPrice", new ArrayList<Object>(totalPrice));
	    map.put("pro_name", new ArrayList<Object>(pro_name));

	    return map;
	}

	@Override
	public Map<String, List<Object>> getTotalByDayList(TotalByDayVO vo) {
	    ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);
		
	    List<Double> totalPrice = new ArrayList<>();
	    List<String> pay_date = new ArrayList<>();

	    List<TotalByDayVO> totalByDayList = mapper.getTotalByDayList(vo);
	    System.out.println(totalByDayList);
	    for (TotalByDayVO item : totalByDayList) {
	    	totalPrice.add((double) item.getTotalPrice());
	        pay_date.add(item.getPay_date());
	    }
	    
	    Map<String, List<Object>> map = new HashMap<>();
	    map.put("totalPrice", new ArrayList<Object>(totalPrice));
	    map.put("pay_date", new ArrayList<Object>(pay_date));

	    return map;
		
	}

}
