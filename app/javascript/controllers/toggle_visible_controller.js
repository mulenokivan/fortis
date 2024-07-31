import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.$block = document.querySelector('.js-toggle-visible')
    this.$content = document.querySelector('.js-toggle-visible-content')
  }

  onShowContent() {
    this.$block.classList.add('js-hidden')
    this.$block.nextElementSibling.classList.remove('js-hidden')
  }

  onHideContent() {
    this.$content.classList.add('js-hidden')
    this.$content.previousElementSibling.classList.remove('js-hidden')
  }
}