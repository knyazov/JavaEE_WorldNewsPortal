package DBManager;

import Entities.Languages;
import Entities.News;
import Entities.Publications;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBManager {

    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaee_db?useUnicode=true&serverTimezone=UTC", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static ArrayList<News> getAllNews() {
        ArrayList<News> allNews = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT n.id, n.title, n.short_content, n.content, n.post_date, n.picture_url, n.language_id, n.publication_id, p.name as publication_name, l.code " +
                    "FROM (news n INNER JOIN languages l on l.id = n.language_id) " +
                    "INNER JOIN publications p " +
                    "ON p.id = n.publication_id" +
                    "");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                News news = new News();
                news.setId(resultSet.getLong("id"));
                news.setTitle(resultSet.getString("title"));
                news.setShortContent(resultSet.getString("short_content"));
                news.setContent(resultSet.getString("content"));
                news.setPostDate(resultSet.getTimestamp("post_date"));
                news.setPictureUrl(resultSet.getString("picture_url"));

                Publications publications = new Publications();
                publications.setId(resultSet.getLong("publication_id"));
                publications.setName(resultSet.getString("publication_name"));

                Languages languages = new Languages();
                languages.setId(resultSet.getLong("language_id"));
                languages.setCode(resultSet.getString("code"));

                news.setPublications(publications);
                news.setLanguages(languages);

                allNews.add(news);

            }
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return allNews;
    }

    public static ArrayList<News> getNews(Languages language) {
        ArrayList<News> newsArrayList = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT n.id, n.title, n.short_content, n.content, n.post_date, n.picture_url, n.language_id, n.publication_id, p.name as publication_name, l.code " +
                    "FROM (news n INNER JOIN languages l on l.id = n.language_id) " +
                    "INNER JOIN publications p " +
                    "ON p.id = n.publication_id" +
                    "WHERE language_id = ? " +
                    "");
            statement.setLong(1, language.getId());
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                News news = new News();
                news.setId(resultSet.getLong("id"));
                news.setTitle(resultSet.getString("title"));
                news.setShortContent(resultSet.getString("short_content"));
                news.setContent(resultSet.getString("content"));
                news.setPostDate(resultSet.getTimestamp("post_date"));
                news.setPictureUrl(resultSet.getString("picture_url"));

                Publications publications = new Publications();
                publications.setId(resultSet.getLong("publication_id"));
                publications.setName(resultSet.getString("publication_name"));

                Languages languages = new Languages();
                languages.setId(resultSet.getLong("language_id"));
                languages.setCode(resultSet.getString("code"));

                news.setPublications(publications);
                news.setLanguages(languages);

                newsArrayList.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newsArrayList;
    }

    public static ArrayList<Publications> getPublications() {
        ArrayList<Publications> publications = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM publications" +
                    "");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Publications publication = new Publications();
                publication.setId(resultSet.getLong("id"));
                publication.setName(resultSet.getString("name"));
                publication.setDescription(resultSet.getString("description"));
                publication.setRation(resultSet.getDouble("rating"));

                publications.add(publication);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return publications;
    }

    public static ArrayList<Languages> getAllLanguages() {
        ArrayList<Languages> languages = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM languages" +
                    "");

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Languages language = new Languages();
                language.setId(resultSet.getLong("id"));
                language.setName(resultSet.getString("name"));
                language.setCode(resultSet.getString("code"));

                languages.add(language);
            }
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return languages;
    }

    public static News getNewsById(Long id) {
        News news = null;

        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT n.id, n.title, n.short_content, n.content, n.post_date, n.picture_url, n.language_id, n.publication_id, p.name as publication_name, l.code " +
                    "FROM (news n INNER JOIN languages l on l.id = n.language_id) " +
                    "INNER JOIN publications p " +
                    "ON p.id = n.publication_id" +
                    "WHERE language_id = ? ");

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                news = new News();
                news.setId(resultSet.getLong("id"));
                news.setTitle(resultSet.getString("title"));
                news.setShortContent(resultSet.getString("short_content"));
                news.setContent(resultSet.getString("content"));
                news.setPostDate(resultSet.getTimestamp("post_date"));
                news.setPictureUrl(resultSet.getString("picture_url"));

                Publications publications = new Publications();
                publications.setId(resultSet.getLong("publication_id"));
                publications.setName(resultSet.getString("publication_name"));

                Languages languages = new Languages();
                languages.setId(resultSet.getLong("language_id"));
                languages.setCode(resultSet.getString("code"));

                news.setPublications(publications);
                news.setLanguages(languages);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }


}