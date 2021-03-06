<%@ include file="/WEB-INF/views/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/views/include/doctype.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Web on the Go &#8480; Account Management</title>
<%@ include file="/WEB-INF/views/include/headTags.jsp"%>
</head>
<body>
  <%@ include file="/WEB-INF/views/include/popups.jsp"%>
  <%@ include file="/WEB-INF/views/include/header.jsp"%>

  <div class="container">
    <div id="main-content">
      <div class="span-18 colborder" style="min-height: 200px;">
        <h3 style="margin-bottom: 10px; padding-bottom: 0px;">Ticket ${ticket.id} Detail</h3>

        <div class="tableContainer">

          <c:if test="${ticket.type != 'INQUIRY'}">
            <table>
              <c:if test="${not empty customer}">
                <tr>
                  <td>Customer:</td>
                  <td class="value">${customer.email} (${customer.userId})</td>
                </tr>
              </c:if>

              <tr>
                <td>Assigned to:</td>
                <td class="value"><c:choose>
                    <c:when test="${not empty assignee}">
                  ${assignee.username} (${assignee.userId})
                </c:when>
                    <c:otherwise>
                  Unassigned
                </c:otherwise>
                  </c:choose></td>
              </tr>

              <c:if test="${not empty creator}">
                <tr>
                  <td>Creator:</td>
                  <td class="value">${creator.email} (${creator.userId})</td>
                </tr>
              </c:if>
            </table>
          </c:if>

          <c:if test="${ticket.type == 'INQUIRY'}">
            <table style="border: 1px #ccc solid; border-radius: 4px;">
              <tr>
                <td>Email:</td>
                <td class="value">${ticket.contactEmail}</td>
              </tr>
              <tr>
                <td>Phone:</td>
                <td class="value">${ticket.contactPhone}</td>
              </tr>
            </table>
          </c:if>

          <table style="border: 1px #ccc solid; border-radius: 4px;">
            <tr>
              <td>Title:</td>
              <td class="value">${ticket.title}</td>
            </tr>
            <tr>
              <td>Description:</td>
              <td class="value">${ticket.description}</td>
            </tr>
            <tr>
              <td>Status:</td>
              <td class="value">${ticket.status.description}</td>
            </tr>
            <tr>
              <td>Priority:</td>
              <td class="value">${ticket.priority.description}</td>
            </tr>
            <tr>
              <td>Category:</td>
              <td class="value">${ticket.category.description}</td>
            </tr>
          </table>

          <table style="border: 1px #ccc solid; border-radius: 4px;">
            <tr>
              <td>Created Date:</td>
              <td class="value"><fmt:formatDate type="date" value="${ticket.createdDate}" /></td>
            </tr>
            <tr>
              <td>Last Modified Date:</td>
              <td class="value"><fmt:formatDate type="date" value="${ticket.lastModifiedDate}" /></td>
            </tr>
          </table>

        </div>


        <h3 style="margin-bottom: 10px; padding-bottom: 0px; border-bottom: 1px #ccc dotted;">Notes</h3>
        <c:choose>
          <c:when test="${not empty ticket.notes}">
            <table>
              <tr>
                <th>ID</th>
                <th>Date</th>
                <th>Author</th>
                <th>Note</th>
              </tr>
              <c:forEach var="note" items="${ticket.notes}">
                <tr>
                  <td><a href="<spring:url value="/support/ticket/note/update/${note.id}" />">${note.id}</a></td>
                  <td><fmt:formatDate type="date" value="${note.date}" /></td>
                  <td>${note.creator.username}</td>
                  <td>${note.note}</td>
                </tr>
              </c:forEach>
            </table>
          </c:when>
          <c:otherwise>
            <p>No notes</p>
          </c:otherwise>
        </c:choose>

        <div class="buttons">
          <a href="<spring:url value="/support/ticket" />" class="button action-m" style="float: right;"><span>Back to Tickets</span></a><a
            href="<spring:url value="/support/ticket/update/${ticket.id}" />" class="button action-m multi" style="float: right;"><span>Update Ticket</span></a>
          <a href="<spring:url value="/support/ticket/note/add/${ticket.id}" />" class="button action-m multi" style="float: right;"><span>Add a Note</span></a>
          <a href="<spring:url value="/support/ticket/reply/${ticket.id}" />" class="button action-m multi" style="float: right;"><span>Reply</span></a>
        </div>

      </div>

      <div class="span-6 last sub-navigation">
        <%@ include file="/WEB-INF/views/include/admin/navigation/adminNav.jsp"%>
      </div>

    </div>
    <!-- Close main-content -->
    <%@ include file="/WEB-INF/views/include/footer_links.jsp"%>
  </div>
  <!-- Close container -->

</body>
</html>