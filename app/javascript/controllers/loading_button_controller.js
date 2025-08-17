import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="loading-button"
export default class extends Controller {
  static targets = ["label", "spinner"]

  connect() {
    this.originalText = this.labelTarget.textContent
  }

  start() {
    this.labelTarget.classList.add("hidden")
    this.spinnerTarget.classList.remove("hidden")
  }

  reset() {
    this.labelTarget.classList.remove("hidden")
    this.spinnerTarget.classList.add("hidden")
  }
}
