<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/recipe"
         user = "root"  password = "root"/>
      
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from new_recipe order by 1 DESC LIMIT 0,20;
      </sql:query>

<div class="col-md-4 foodrecipes-side-menu-bgcolor main-sidebar" >
                    <aside id="search-2" class="widget blog-categories widget_search">
                        <form role="search" method="get" class="search-form" action="http://localhost:81/wordpress/" target="_self">
                            <label style="height: 25px;">
                                            <span class="screen-reader-text">Search for:</span>
                                            <input type="search" class="search-field" placeholder="Search ?" value="" name="s">
                                    </label>
                                    <input type="submit" class="search-submit" value="Search">
                            </form>
                    </aside>
                    <aside id="recent-posts-2" class="widget blog-categories widget_recent_entries">
                        <h2 class="widget-title">
                            <center> Recent Posts</center>
                        </h2>
                        <ul style="list-style-type: square;">
                            <c:forEach var = "row" items = "${result.rows}">
                            <li style="font-size: 15px;">
                                <a href="page.jsp?id=<c:out value = "${row.id}"/>" target="_self">
                                    <c:out value="${row.post_title}"/>
                                </a>
                            </li>
                            </c:forEach>
                        </ul>
                    </aside>
                </div>


            </div>
            
        </div>

<footer>
            <div class="col-md-12 footer">
                <h2>
                    &copy; Copyright of Group 5
                </h2>
            </div>
        </footer>
        
    </body>
</html>

