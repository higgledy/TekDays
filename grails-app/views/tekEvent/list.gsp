

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>TekEvent List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New TekEvent</g:link></span>
        </div>
        <div class="body">
            <h1>TekEvent List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="city" title="City" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        
                   	    
                   	        <g:sortableColumn property="venue" title="Venue" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${tekEventInstanceList}" status="i" var="tekEventInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${tekEventInstance.id}">${fieldValue(bean:tekEventInstance, field:'name')}</g:link></td>
                        

                        
                            <td>${fieldValue(bean:tekEventInstance, field:'city')}</td>
                        
                            <td>${fieldValue(bean:tekEventInstance, field:'description')}</td>
                        
                            
                        
                            <td>${fieldValue(bean:tekEventInstance, field:'venue')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${tekEventInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
