<content:title>
    <fmt:message key="devices" />
</content:title>

<content:section cssId="deviceListPage">
    <div class="section row">
        <c:if test="${not empty devices}">
            <table class="bordered highlight">
                <thead>
                    <th><fmt:message key="device.id" /></th>
                    <th><fmt:message key="model" /></th>
                    <th><fmt:message key="manufacturer" /></th>
                    <th><fmt:message key="time.registered" /></th>
                    <th><fmt:message key="os.version" /></th>
                </thead>
                <tbody>
                    <c:forEach var="device" items="${devices}">
                        <tr class="device">
                            <td>
                                ${device.deviceId}
                            </td>
                            <td>
                                ${device.deviceModel}
                            </td>
                            <td>
                                ${device.deviceManufacturer}
                            </td>
                            <td>
                                <fmt:formatDate value="${device.timeRegistered.time}" type="both" timeStyle="short" />
                            </td>
                            <td>
                                ${device.osVersion}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</content:section>
