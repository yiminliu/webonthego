<c:if test="${not empty sessionScope.CONTROLLING_USER}">
  <sec:authorize ifAnyGranted="ROLE_ADMIN, ROLE_MANAGER">
    <%@ include file="/WEB-INF/views/include/admin/control_bar.jsp"%>
  </sec:authorize>
</c:if>

<div class="container">
  <div id="header">

    <!-- Begin Logo -->
    <div class="logo">
      <a href="https://account.webonthego.com/"> <img src="<spring:url value='/static/images/logo/logo_s1.png' />" alt="WebOnTheGo Logo" />
      </a>
    </div>
    <!-- End Logo -->

    <!-- Begin Login/Logout -->
    <c:if test="${sessionScope.CONTROLLING_USER.userId == -1}">
      <div class="secondary-navigation">
        <ul>
          <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
            <li>Welcome ${USER.contactInfo.firstName} ${USER.contactInfo.lastName}</li>
          </sec:authorize>
          <c:if test="${empty param.login_error}">
            <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
              <li><a href="<spring:url value='/logout' />">Logout</a></li>
            </sec:authorize>
          </c:if>
        </ul>
      </div>
    </c:if>
    <!-- End Login/Logout -->

    <!-- Begin Navigation -->
    <div class="navigation">
      <ul>
        <li><a href="https://account.webonthego.com/">Home</a></li>
        <li><a href="https://store.webonthego.com/">Store</a></li>
        <li><a href="<spring:url value="/support"/>">Support</a></li>
      </ul>
    </div>
    <!-- End Navigation -->

  </div>
</div>

<div class="clear"></div>
<div class="blueGradient"></div>