package Entities;

import java.sql.Timestamp;

public class News {
    private Long id;
    private String title;
    private String shortContent;
    private String content;
    private Timestamp postDate;
    private String pictureUrl;
    private Languages languages;
    private Publications publications;

    public News() {
    }

    public News(Long id, String title, String shortContent, String content, Timestamp postDate, String pictureUrl, Languages languages, Publications publications) {
        this.id = id;
        this.title = title;
        this.shortContent = shortContent;
        this.content = content;
        this.postDate = postDate;
        this.pictureUrl = pictureUrl;
        this.languages = languages;
        this.publications = publications;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShortContent() {
        return shortContent;
    }

    public void setShortContent(String shortContent) {
        this.shortContent = shortContent;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getPostDate() {
        return postDate;
    }

    public void setPostDate(Timestamp postDate) {
        this.postDate = postDate;
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    public Languages getLanguages() {
        return languages;
    }

    public void setLanguages(Languages languages) {
        this.languages = languages;
    }

    public Publications getPublications() {
        return publications;
    }

    public void setPublications(Publications publications) {
        this.publications = publications;
    }
}
