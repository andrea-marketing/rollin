import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  on() {
    this.linkTarget.classList.add("on")
  }
}
