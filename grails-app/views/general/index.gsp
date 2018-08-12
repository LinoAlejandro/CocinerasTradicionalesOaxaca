<g:if test="${session.language == 'English'}">
  <g:render template="indexEnglish" />
</g:if>
<g:else>
  <g:render template="indexEspanol" />
</g:else>
