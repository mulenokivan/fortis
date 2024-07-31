import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const $fileInput = this.element.querySelector('.js-input-file')
    const $fileSpan = this.element.querySelector('.js-input-file--span')
    const spanContent = $fileSpan.textContent

    $fileInput.addEventListener('change', function(event) {
      const fileName = event.target.files[0].name
      $fileSpan.textContent = spanContent + " " + fileName
      $fileSpan.classList.remove('js-hidden')
    })
  }
}
