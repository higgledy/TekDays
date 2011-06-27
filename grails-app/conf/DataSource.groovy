dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	username = "tekdays_adm"
	password = "tekdays_adm321"
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			//pooled = true
			//driverClassName = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://localhost:3306/tekdays"
			dbCreate = "update"
			//username = "tekdays_adm"
			//password = "tekdays_adm321"
			//dialect="org.hibernate.dialect.MySQL5InnoDBDialect"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:file:prodDb;shutdown=true"
		}
	}
}