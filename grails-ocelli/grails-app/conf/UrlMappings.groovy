class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
		"/old"(view:"/index_default")
        "500"(view:'/error')
		"/ajax/applications"(view:'application/index')
	}
}
