// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

import SearchController from "./search_controller.js"
application.register("search", SearchController)