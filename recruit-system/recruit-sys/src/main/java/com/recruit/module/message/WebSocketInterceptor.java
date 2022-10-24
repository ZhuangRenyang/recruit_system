//package com.recruit.module.message;
//
//import com.auth0.jwt.exceptions.AlgorithmMismatchException;
//import com.auth0.jwt.exceptions.InvalidClaimException;
//import com.auth0.jwt.exceptions.JWTDecodeException;
//import com.auth0.jwt.exceptions.SignatureVerificationException;
//import com.auth0.jwt.exceptions.TokenExpiredException;
//import com.auth0.jwt.interfaces.Claim;
//import io.github.talelin.core.token.DoubleJWT;
//import com.recruit.model.UserDO;
//import com.recruit.service.GroupService;
//import com.recruit.service.UserService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.server.ServerHttpRequest;
//import org.springframework.http.server.ServerHttpResponse;
//import org.springframework.http.server.ServletServerHttpRequest;
//import org.springframework.web.socket.WebSocketHandler;
//import org.springframework.web.socket.server.HandshakeInterceptor;
//
//import java.io.IOException;
//import java.nio.charset.StandardCharsets;
//import java.util.Map;
//
//import static com.recruit.module.message.MessageConstant.USER_KEY;
//
//public class WebSocketInterceptor implements HandshakeInterceptor {
//    @Autowired
//    private DoubleJWT jwt;
//
//    @Autowired
//    private UserService userService;
//
//    @Autowired
//    private GroupService groupService;
//
//    @Override
//    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler webSocketHandler, Map<String, Object> attributes) throws Exception {
//        if (request instanceof ServletServerHttpRequest) {
//            ServletServerHttpRequest httpServletRequest = (ServletServerHttpRequest) request;
//            String tokenStr = httpServletRequest.getServletRequest().getParameter("token");
//            if (tokenStr == null || tokenStr.isEmpty()) {
//                writeMessageToBody(response, "请传入授权字段");
//                return false;
//            }
//            Map<String, Claim> claims;
//            try {
//                claims = jwt.decodeAccessToken(tokenStr);
//            } catch (TokenExpiredException e) {
//                writeMessageToBody(response, "令牌已过期");
//                return false;
//            } catch (AlgorithmMismatchException | SignatureVerificationException | JWTDecodeException | InvalidClaimException e) {
//                writeMessageToBody(response, "令牌无效");
//                return false;
//            }
//            if (claims == null) {
//                writeMessageToBody(response, "令牌无效，无法解码");
//                return false;
//            }
//            int identity = claims.get("identity").asInt();
//            UserDO user = userService.getById(identity);
//            if (user == null) {
//                writeMessageToBody(response, "不存在的用户");
//                return false;
//            }
//            attributes.put(USER_KEY, user);
//            return true;
//        }
//        return false;
//    }
//
//    @Override
//    public void afterHandshake(ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse, WebSocketHandler webSocketHandler, Exception e) {
//
//    }
//
//    private boolean verifyAdmin(UserDO user) {
//        return groupService.checkIsRootByUserId(user.getId());
//    }
//
//    private void writeMessageToBody(ServerHttpResponse response, String message) throws IOException {
//        response.setStatusCode(HttpStatus.BAD_REQUEST);
//        response.getBody().write(message.getBytes(StandardCharsets.UTF_8));
//    }
//
//}
