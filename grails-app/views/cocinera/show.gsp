<g:if test="${session.language == 'Español'}">
  <g:render template="${request.getContextPath()}/cocinera/showEspanol" />
</g:if>
<g:if test="${session.language == 'English'}">
  <g:render template="${request.getContextPath()}/cocinera/showEnglish" />
</g:if>
