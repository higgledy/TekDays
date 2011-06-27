

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create TekEvent</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">TekEvent List</g:link></span>
        </div>
        <div class="body">
            <h1>Create TekEvent</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tekEventInstance}">
            <div class="errors">
                <g:renderErrors bean="${tekEventInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:tekEventInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city">City:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'city','errors')}">
                                    <input type="text" id="city" name="city" value="${fieldValue(bean:tekEventInstance,field:'city')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'description','errors')}">
                                    <textarea rows="5" cols="40" name="description">${fieldValue(bean:tekEventInstance, field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="organizer">Organizer:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'organizer','errors')}">
                                    <g:select optionKey="id" from="${TekUser.list()}" name="organizer.id" value="${tekEventInstance?.organizer?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="venue">Venue:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'venue','errors')}">
                                    <input type="text" id="venue" name="venue" value="${fieldValue(bean:tekEventInstance,field:'venue')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" precision="day" 
										value="${tekEventInstance?.startDate}"  >
									</g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekEventInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" precision="day" value="${tekEventInstance?.endDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
