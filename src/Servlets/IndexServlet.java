package Servlets;

import DBManager.DBManager;
import Entities.Languages;
import Entities.News;
import Entities.Publications;
import Entities.User;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/index")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser != null) {
            request.setAttribute("currentUsder", currentUser);
        }

        String language = request.getParameter("language");
//        Cookie cookie = new Cookie("language", language);
//        response.addCookie(cookie);
        //response.sendRedirect();
        String lng = request.getParameter("lng");
        if (lng!=null){
            Cookie cookie = new Cookie("lng", lng);
            cookie.setMaxAge(24*3600*30);
            response.addCookie(cookie);
        }

        Cookie cookies[] = request.getCookies();
        Long langId = 1L;
        if (cookies!=null){
            for (Cookie c:
                    cookies) {
                if (c.getName().equals("lng")){
                    langId = Long.parseLong(c.getValue());
                    break;
                }
            }
        }

        Languages languages1 = new Languages();
        languages1.setId(1L);


        ArrayList<Languages> languages = DBManager.getAllLanguages();
        request.setAttribute("languages", languages);

        ArrayList<Publications> publications = DBManager.getPublications();
        request.setAttribute("allPublications", publications);

        ArrayList<News> allNews = DBManager.getAllNews();
        request.setAttribute("allNews", allNews);

//        ArrayList<News> getSelectedNews = DBManager.getNews(languages);
//        request.setAttribute("news", getSelectedNews);

        String pName = request.getParameter("pName");
        if (pName != null){
            ArrayList<News> news =  DBManager.getNewsByName(pName);
            request.setAttribute("newsByName", news);
        }

        request.getRequestDispatcher("/index.jsp").forward(request, response);

    }
}
