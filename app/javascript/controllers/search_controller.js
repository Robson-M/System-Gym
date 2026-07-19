import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.delay = null
    }

    submit() {
        clearTimeout(this.delay)
        this.delay = setTimeout(() => {
            this.element.requestSubmit()
            }, 300)
    }
}