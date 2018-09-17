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

public class NaverProfileJoin {

	
	public String NaverSign_in(String access_token) {
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
			System.out.println("Data : " + jsonData.toString());
			JSONObject res = (JSONObject) jsonData.get("response");
			
			System.out.println("email : " + res.get("email").toString());
			String m_userid = "aa";
			
			MemberVO m_set = new MemberVO();
			m_set.setM_userid(m_userid);
			m_set.setM_confirm(confirm);
			System.out.println("user_id : " + m_set.getM_userid());
			System.out.println("confirm : " + m_set.getM_confirm());
			MemberVO check = new MemberDAOImpl().select_User(m_set);
			if(check == null) {
				System.out.println(0);
				MemberVO m = new MemberVO();
				m.setM_userid(m_userid);
				m.setM_email(res.get("email").toString());
				m.setM_name(res.get("name").toString());
				m.setM_birth(res.get("birthday").toString());
				m.setM_gender(res.get("gender").toString());
				m.setM_confirm(confirm);
				new MemberDAOImpl().naver_join(m);
				return m_userid;
			} else {
				System.out.println("null 아니다");
				return m_userid;
			}
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
        return null;
	}
}
