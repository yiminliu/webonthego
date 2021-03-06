<div id="header">

  <!-- Begin Logo -->
  <div class="span-12">
    <div class="logo">
      <a href="<spring:url value='/' />">
        <img src="<spring:url value='/static/images/logo/logo_s1.png'/>" alt="WebOnTheGo Logo"  />
      </a>
    </div>
  </div>
  <!-- End Logo -->
  
  <div class="span-12 last">
    <!-- Begin Secondary Navigation -->
    <div class="secondary-navigation">
      <ul>
        <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
          <li>Welcome ${user.username}</li>
        </sec:authorize>
        <c:if test="${empty param.login_error}">
          <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
            <li><a href="<spring:url value='/j_spring_security_logout' />">Logout</a></li>
          </sec:authorize>
        </c:if>
      </ul>
    </div>
    <!-- End Secondary Navigation -->
      
    <!-- Begin Navigation -->
    <div class="navigation">
      <sec:authorize ifNotGranted="ROLE_ANONYMOUS">   
    <ul> 
      <li><a href="https://account.webonthego.com/">Home</a></li> 
      <li><a href="https://store.webonthego.com/">Store</a></li> 
      <li><a href="https://account.webonthego.com/support/">Support</a></li> 
    </ul> 
      </sec:authorize>
    </div>
  </div>
  <!-- End Navigation -->
</div>
<div class="clear"></div>

<div class="blueGradient"></div>