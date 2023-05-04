package com.kelvin.joyinternetcafe.exception.handler;

import com.kelvin.joyinternetcafe.exception.BaseException;
import com.kelvin.joyinternetcafe.exception.ErrorResponse;
import com.kelvin.joyinternetcafe.exception.ResourceNotFoundException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@RestControllerAdvice
public class GlobalExceptionHandler {

    // 芋道源码
    @ExceptionHandler(ArithmeticException.class)
    public HashMap<String,Object> arithmeticExceptionAdvice(ArithmeticException e) {
        HashMap<String, Object> result = new HashMap<>();
        result.put("state",-1);
        result.put("data",null);
        result.put("msg" , "算出异常："+ e.getMessage());
        return result;
    }

    @ExceptionHandler(NullPointerException.class)
    public HashMap<String,Object> nullPointerExceptionAdvice(NullPointerException e) {
        HashMap<String, Object> result = new HashMap<>();
        result.put("state",-1);
        result.put("data",null);
        result.put("msg" , "空指针异常异常："+ e.getMessage());
        return result;
    }

    /*@ExceptionHandler(Exception.class)
    public HashMap<String,Object> exceptionAdvice(Exception e) {
        HashMap<String, Object> result = new HashMap<>();
        result.put("state",-1);
        result.put("data",null);
        result.put("msg" , "异常："+ e.getMessage());
        return result;
    }*/

    // Java Guide
    @ExceptionHandler(BaseException.class)
    public ResponseEntity<?> handleAppException(BaseException e, HttpServletRequest request) {
        ErrorResponse representation = new ErrorResponse(e, request.getRequestURI());
        return new ResponseEntity<>(representation, new HttpHeaders(), e.getError().getStatus());
    }

    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<ErrorResponse> handleResourceNotFoundException(ResourceNotFoundException e, HttpServletRequest request) {
        ErrorResponse errorResponse = new ErrorResponse(e, request.getRequestURI());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorResponse);
    }
}
