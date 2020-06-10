<content:title>
    <fmt:message key="numbers" /> (${fn:length(numbers)})
</content:title>

<content:section cssId="numberListPage">
    <div class="section row">
        <a class="right btn waves-effect waves-light grey-text white" 
           href="<spring:url value='/content/number/list/numbers.csv' />">
            <fmt:message key="export.to.csv" /><i class="material-icons right">vertical_align_bottom</i>
        </a>
        
        <p>
            <fmt:message key="to.add.new.content.click.the.button.below" />
        </p>
        
        <table class="bordered highlight">
            <thead>
                <th><fmt:message key="value" /></th>
                <th><fmt:message key="symbol" /></th>
                <th><fmt:message key="number.words" /></th>
                <th><fmt:message key="allophones" /></th>
                <th><fmt:message key="revision" /></th>
                <th><fmt:message key="edit" /></th>
            </thead>
            <tbody>
                <c:forEach var="number" items="${numbers}">
                    <tr class="letter">
                        <td style="font-size: 2em;">
                            <a name="${number.id}"></a>
                            ${number.value}
                        </td>
                        <td style="font-size: 2em;">
                            ${number.symbol}
                        </td>
                        <td style="font-size: 2em;">
                            <c:forEach var="word" items="${number.words}">
                                <a href="<spring:url value='/content/word/edit/${word.id}' />">${word.text}</a>
                            </c:forEach>
                        </td>
                        
                        <td style="font-size: 2em;">
                            <c:forEach var="word" items="${number.words}">
                                /<c:forEach var="allophone" items="${word.allophones}"><a href="<spring:url value='/content/allophone/edit/${allophone.id}' />">${allophone.valueIpa}</a></c:forEach>/
                            </c:forEach>
                        </td>
                        <td>
                            #${number.revisionNumber}
                        </td>
                        <td>
                            <a class="editLink" href="<spring:url value='/content/number/edit/${number.id}' />"><i class="material-icons">edit</i><fmt:message key="edit" /></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <div class="fixed-action-btn" style="bottom: 2em; right: 2em;">
        <a href="<spring:url value='/content/number/create' />" class="btn-floating btn-large tooltipped" data-position="left" data-delay="50" data-tooltip="<fmt:message key="add.number" />"><i class="material-icons">add</i></a>
    </div>
</content:section>
