package com.ff.controller;

import com.ff.model.User;
import com.ff.serivce.UserService;
import com.ff.util.Common;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userServivce;
    @Autowired
    private AuthenticationManager myAuthenticationManager;

    /**
     * 登陆页面
     *
     * @return
     */
//    @RequestMapping(value = "/login")
//    public String login() {
//        return "/sys/login";
//    }

    //表单提交过来的路径
    @RequestMapping("/checkLogin")
    public String checkLogin(User user, String username, String password, Model model, HttpSession session) {
        //调用service方法
        user = (User) userServivce.checkLogin(username, password);
        //若有user则添加到model里并且跳转到成功页面
        if (user != null) {
            session.setAttribute("USER_SESSION", user);
            return "management/index";
        } else {
            model.addAttribute("msg", "账号或者密码错误！");
            return "/sys/login";
        }
    }


    //注销方法
    @RequestMapping("/logout")
    public String outLogin(HttpSession session) {
        //通过session.invalidata()方法来注销当前的session
        session.invalidate();
        return "/sys/login";
    }



    @RequestMapping ("/login")
    public String login(Model model,HttpServletRequest request)
    {
        //重新登录时销毁该用户的Session
        Object o = request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
        if(null != o){
            request.getSession().removeAttribute("SPRING_SECURITY_CONTEXT");
        }
        return "/sys/login";
    }

    @RequestMapping("/loginSys")
    public String loginSys(String username, String password, HttpServletRequest request){
        try {
            if (!request.getMethod().equals("POST")) {
                request.setAttribute("error","支持POST方法提交！");
            }
            if (Common.isEmpty(username) || Common.isEmpty(password)) {
                request.setAttribute("error","用户名或密码不能为空！");
                return "/sys/login";
            }
            // 验证用户账号与密码是否正确
            User users = this.userServivce.querySingleUser(username);
            if (users == null || !users.getPassword().equals(password)) {
                request.setAttribute("error", "用户或密码不正确！");
                return "/sys/login";
            }
            Authentication authentication = myAuthenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(username,password));
            SecurityContext securityContext = SecurityContextHolder.getContext();
            securityContext.setAuthentication(authentication);
            HttpSession session = request.getSession(true);
            session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
            // 当验证都通过后，把用户信息放在session里
            request.getSession().setAttribute("userSession", users);
//            // 记录登录信息
//            UserLoginList userLoginList = new UserLoginList();
//            userLoginList.setUserId(users.getUserId());
//            userLoginList.setLoginIp(Common.toIpAddr(request));
//            userLoginListService.add(userLoginList);
        } catch (AuthenticationException ae) {
            request.setAttribute("error", "登录异常，请联系管理员！");
            return "/sys/login";
        }
        return "redirect:/compact/index";
    }
}