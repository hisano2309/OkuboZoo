package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AuthFilter
 */
@WebFilter(urlPatterns={"/gacha/*","/mypage/*","/logout/*"})
public class AuthFilter extends HttpFilter implements Filter {

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// doFilter()メソッド内でgetRequestURI()メソッドを使うためにキャストする
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		String uri = req.getRequestURI();
		// リクエストされたURIが「/login」「/register」「/index」の場合は認証済みかの確認をしない
//		if (!uri.endsWith("/login") && !uri.endsWith("/register") && !uri.endsWith("/index")) {
			// セッション変数が存在しない場合はログインページへリダイレクト
			if (session.getAttribute("user") == null) {
				res.sendRedirect(req.getContextPath() + "/index");
				return;
			}
//		}

		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

}
