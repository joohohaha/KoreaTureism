package com.saem.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.saem.domain.MemberVO;
import com.saem.persistence.MemberDAOImpl;
import com.saem.service.MemberService;
import com.saem.service.MemberServiceImpl;

public class NaverProfileJoin {
	
	public MemberVO NaverSign_in(String access_token) {
		String token = access_token;// 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        final String confirm = "Naver_user"; 
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            JSONParser parser = new JSONParser();
			JSONObject jsonData = (JSONObject)parser.parse(response.toString());
			
			JSONObject res = (JSONObject) jsonData.get("response");
			String m_userid = res.get("email").toString().split("@")[0];
			System.out.println(m_userid);
			
			MemberVO member = new MemberVO();
			
			member.setM_userid(m_userid);
			member.setM_email(res.get("email").toString());
			member.setM_name(res.get("name").toString());
			member.setM_birth(res.get("birthday").toString());
			member.setM_gender(res.get("gender").toString());
			member.setM_confirm(confirm);
			
			return member;
			
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
        return null;
	}
}
