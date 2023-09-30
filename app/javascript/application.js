// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import Alpine from "alpinejs"
import persist from '@alpinejs/persist'

Alpine.plugin(persist)
Alpine.start()
