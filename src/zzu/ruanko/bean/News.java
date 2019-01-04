package zzu.ruanko.bean;



/**
 * News entity. @author MyEclipse Persistence Tools
 */

public class News  implements java.io.Serializable {


    // Fields    

     private String id;
     private String username;
     private String newstype;
     private String title;
     private String author;
     private String keywords;
     private String source;
     private String content;
     private String createTime;
     private Integer click;
     private Integer state;
     private Integer del;


    // Constructors

    /** default constructor */
    public News() {
    }

	/** minimal constructor */
    public News(String nid, String title, String content) {
        this.id = nid;
        this.title = title;
        this.content = content;
    }
    
    /** full constructor */
    public News(String nid, String username, String newstype, String title, String author, String keywords, String source, String content, String createTime, Integer click, Integer state, Integer del) {
        this.id = nid;
        this.username = username;
        this.newstype = newstype;
        this.title = title;
        this.author = author;
        this.keywords = keywords;
        this.source = source;
        this.content = content;
        this.createTime = createTime;
        this.click = click;
        this.state = state;
        this.del = del;
    }

   
    // Property accessors

    public String getId() {
        return this.id;
    }
    
    public void setId(String nid) {
        this.id = nid;
    }

    
    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNewstype() {
        return this.newstype;
    }
    
    public void setNewstype(String newstype) {
        this.newstype = newstype;
    }

    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return this.author;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }

    public String getKeywords() {
        return this.keywords;
    }
    
    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getSource() {
        return this.source;
    }
    
    public void setSource(String source) {
        this.source = source;
    }

    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateTime() {
        return this.createTime;
    }
    
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public Integer getClick() {
        return this.click;
    }
    
    public void setClick(Integer click) {
        this.click = click;
    }

    public Integer getState() {
        return this.state;
    }
    
    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getDel() {
        return this.del;
    }
    
    public void setDel(Integer del) {
        this.del = del;
    }
   








}