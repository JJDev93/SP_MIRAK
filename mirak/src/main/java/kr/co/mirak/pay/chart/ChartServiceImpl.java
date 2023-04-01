package kr.co.mirak.pay.chart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Map<String, List<Object>> getTotalByMenuList(TotalByMenuVO vo) {
		ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);

		List<String> pro_name = new ArrayList<>();
		List<Double> totalPrice = new ArrayList<>();
		List<Double> totalRatio = new ArrayList<>();

		List<TotalByMenuVO> totalByMenuList = mapper.getTotalByMenuList(vo);
		for (TotalByMenuVO item : totalByMenuList) {
			pro_name.add(item.getPro_name());
			totalPrice.add((double) item.getTotalPrice());
			totalRatio.add((double) item.getTotalRatio());
		}

		Map<String, List<Object>> map = new HashMap<>();
		map.put("pro_name", new ArrayList<Object>(pro_name));
		map.put("totalPrice", new ArrayList<Object>(totalPrice));
		map.put("totalRatio", new ArrayList<Object>(totalRatio));

		return map;
	}

	@Override
	public Map<String, List<Object>> getCountByGender(RatioByVO vo, String clickedMenu) {
		ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);
		
		List<Integer> mem_gender = new ArrayList<>();
		List<Integer> countByGender = new ArrayList<>();

		List<RatioByVO> countByGenderList = mapper.getCountByGender(vo, clickedMenu);
		for (RatioByVO item : countByGenderList) {
			mem_gender.add(item.getMem_gender());
			countByGender.add(item.getCount());
		}

		Map<String, List<Object>> map = new HashMap<>();
		map.put("mem_gender", new ArrayList<Object>(mem_gender));
		map.put("countByGender", new ArrayList<Object>(countByGender));

		return map;
	}

	@Override
	public Map<String, List<Object>> getCountByAge(RatioByVO vo, String clickedMenu) {
		ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);

		List<Integer> mem_age = new ArrayList<>();
		List<Integer> countByAge = new ArrayList<>();

		List<RatioByVO> countByAgeList = mapper.getCountByAge(vo, clickedMenu);
		for (RatioByVO item : countByAgeList) {
			mem_age.add(item.getMem_age());
			countByAge.add(item.getCount());
		}

		Map<String, List<Object>> map = new HashMap<>();
		map.put("mem_age", new ArrayList<Object>(mem_age));
		map.put("countByAge", new ArrayList<Object>(countByAge));

		return map;
	}
	
	@Override
	public Map<String, List<Object>> getPurchaseRateList(PurchaseRateVO vo) {
		ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);
		
		List<String> pro_name = new ArrayList<>();
		List<Integer> cart_cnt = new ArrayList<>();
		List<Integer> cart_show = new ArrayList<>();
		List<Double> ratio = new ArrayList<>();
		List<String> rec = new ArrayList<>();
		
		List<PurchaseRateVO> purchaseRateList = mapper.getPurchaseRateList(vo);
		for (PurchaseRateVO item : purchaseRateList) {
			pro_name.add(item.getPro_name());
			cart_cnt.add(item.getCart_cnt());
			cart_show.add(item.getCart_show());
			ratio.add(item.getRatio());
			rec.add(item.getRec());
		}
		
		Map<String, List<Object>> map = new HashMap<>();
		map.put("pro_name", new ArrayList<Object>(pro_name));
		map.put("cart_cnt", new ArrayList<Object>(cart_cnt));
		map.put("cart_show", new ArrayList<Object>(cart_show));
		map.put("ratio", new ArrayList<Object>(ratio));
		map.put("rec", new ArrayList<Object>(rec));
		
		return map;
	}
	

	@Override
	public Map<String, Map<String, List<Object>>> getTotalUsersList(TotalUsersVO vo) {
	    ChartMapper mapper = sqlSessionTemplate.getMapper(ChartMapper.class);

	    Map<String, List<Object>> maleMap = new HashMap<>();
	    Map<String, List<Object>> femaleMap = new HashMap<>();

	    List<TotalUsersVO> totalUsersList = mapper.getTotalUsersList(vo);
	    for (TotalUsersVO item : totalUsersList) {
	        String gender = item.getGender(); // "남자" 또는 "여자"
	        List<Object> totalUsers = gender.equals("남자") ? maleMap.get("totalUsers") : femaleMap.get("totalUsers");
	        List<Object> regdate = gender.equals("남자") ? maleMap.get("regdate") : femaleMap.get("regdate");

	        if (totalUsers == null) {
	            totalUsers = new ArrayList<>();
	        }
	        if (regdate == null) {
	            regdate = new ArrayList<>();
	        }

	        totalUsers.add(item.getTotalUsers());
	        regdate.add(item.getRegdate());

	        if (gender.equals("남자")) {
	            maleMap.put("totalUsers", totalUsers);
	            maleMap.put("regdate", regdate);
	        } else {
	            femaleMap.put("totalUsers", totalUsers);
	            femaleMap.put("regdate", regdate);
	        }
	    }

	    Map<String, Map<String, List<Object>>> map = new HashMap<>();
	    map.put("남자", maleMap);
	    map.put("여자", femaleMap);

	    return map;
	}


}
