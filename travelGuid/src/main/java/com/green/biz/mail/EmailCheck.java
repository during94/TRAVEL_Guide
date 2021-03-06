package com.green.biz.mail;

import java.util.Random;

import org.springframework.stereotype.Service;

@Service
public class EmailCheck {
	
	
	// 이메일 난수 만드는 메서드
		private String init() {
			Random ran = new Random();
			StringBuffer sb = new StringBuffer();
			int num = 0;

			do {
				num = ran.nextInt(75) + 48;
				if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
					sb.append((char) num);
				} else {
					continue;
				}

			} while (sb.length() < size);
			
			return sb.toString();
		}

		// 난수를 이용한 키 생성
		private int size;

		public String getKey(int size) {
			this.size = size;
			return init();
		}
		
		
}
