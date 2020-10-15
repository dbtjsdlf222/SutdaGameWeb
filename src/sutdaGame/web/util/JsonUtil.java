package sutdaGame.web.util;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUtil {
	
	public static String convertToJsonString(Object obj) throws JsonProcessingException {
		return new ObjectMapper().writeValueAsString(obj); 
	}
	
	public static ResponseEntity<String> convertToResponseEntity(Object obj) throws JsonProcessingException {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", MediaType.APPLICATION_JSON_UTF8_VALUE);
		return new ResponseEntity<String>(convertToJsonString(obj), headers, HttpStatus.OK);
	} //ResponseEntity();
	
	public static ResponseEntity<String> responseStatusOK() {
		return new ResponseEntity<String>(HttpStatus.OK);
	} //responseStatusOK();
	
	public static ResponseEntity<String> responseStatusBadRequest(String res) throws JsonProcessingException {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", MediaType.APPLICATION_JSON_UTF8_VALUE);
		
		return new ResponseEntity<String>(convertToJsonString(res), headers, HttpStatus.BAD_REQUEST);
	} //responseStatusBadRequest();
	
} //class JsonUtil;