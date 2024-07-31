import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  connect() {
    const $fixedMenu = this.element.querySelector('.fixed-menu__inner')
    window.addEventListener('resize', function() {
      $fixedMenu.style.height = window.innerHeight + 'px'
    })

    document.addEventListener('click', function(event) {
      const isPressedOnFixedMenu = event.target.closest('.fixed-menu')
      if (!isPressedOnFixedMenu) {
        $fixedMenu.classList.remove('js-fixed-menu--visible')
      }
    })
  }

  openMenu() {
    const $fixedMenu = document.querySelector('.fixed-menu__inner')
    $fixedMenu.classList.toggle('js-fixed-menu--visible')
    $fixedMenu.style.height = window.innerHeight + 'px'
  }
}
