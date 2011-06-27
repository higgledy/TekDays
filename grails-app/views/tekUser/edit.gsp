

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit TekUser</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">TekUser List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New TekUser</g:link></span>
        </div>
        <div class="body">
            <h1>Edit TekUser</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${tekUserInstance}">
            <div class="errors">
                <g:renderErrors bean="${tekUserInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${tekUserInstance?.id}" />
                <input type="hidden" name="version" value="${tekUserInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fullName">Full Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'fullName','errors')}">
                                    <input type="text" id="fullName" name="fullName" value="${fieldValue(bean:tekUserInstance,field:'fullName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userName">User Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'userName','errors')}">
                                    <input type="text" id="userName" name="userName" value="${fieldValue(bean:tekUserInstance,field:'userName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:tekUserInstance,field:'email')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="website">Website:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'website','errors')}">
                                    <input type="text" id="website" name="website" value="${fieldValue(bean:tekUserInstance,field:'website')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bio">Bio:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'bio','errors')}">
                                    <textarea rows="5" cols="40" name="bio">${fieldValue(bean:tekUserInstance, field:'bio')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:tekUserInstance,field:'password','errors')}">
                                    <input type="text" id="password" name="password" value="${fieldValue(bean:tekUserInstance,field:'password')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
