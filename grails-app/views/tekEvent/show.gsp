

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show TekEvent</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">TekEvent List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New TekEvent</g:link></span>
        </div>
        <div class="body">
            <h1>${fieldValue(bean:tekEventInstance, field:'name')}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tekEventInstance, field:'description')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Location:</td>
                            
                            <td valign="top" class="value">
								${fieldValue(bean:tekEventInstance, field:'venue')},
								${fieldValue(bean:tekEventInstance, field:'city')}
							</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Start Date:</td>
                            
                            <td valign="top" class="value">
								<g:formatDate format="MMMM dd, yyyy"
									date:"${tekEventInstance.startDate}"/>
							</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">End Date:</td>
                            
                            <td valign="top" class="value">
								<g:formatDate format="MMMM dd, yyyy"
									date:"${tekEventInstance.endDate}"/>
							</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Organizer:</td>
                            
                            <td valign="top" class="value"><g:link controller="tekUser" action="show" id="${tekEventInstance?.organizer?.id}">${tekEventInstance?.organizer?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Volunteers:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="v" in="${tekEventInstance.volunteers}">
                                    <li><g:link controller="tekUser" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Sponsorships:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="s" in="${tekEventInstance.sponsorships}">
                                    <li><g:link controller="sponsorship" action="show" id="${s.id}">
										${s.sponsor?.encodeAsHTML()}
									</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Tasks:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="t" in="${tekEventInstance.tasks}">
                                    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Messages:</td>                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <g:link controller="message" action="list" id="${tekEventInstance.id}">
									View Messages
								</g:link>
                            </td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Respondents:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:tekEventInstance, field:'respondents')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${tekEventInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
