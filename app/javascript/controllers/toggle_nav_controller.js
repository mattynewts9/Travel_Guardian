import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-nav"

export default class extends Controller {
  static targets = ["hamburger", "navMenu"]

  toggleMenu() {
    console.log("toggle menu clicked");
    this.hamburgerTarget.classList.toggle("active");
    this.navMenuTarget.classList.toggle("nav-menu");
  }

  removeActive() {
    this.hamburgerTarget.classList.remove("active")
    this.navMenuTarget.classList.remove("active")
  }
}
