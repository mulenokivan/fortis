import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {

  static values = {
    url: String,
    test: String
  }

  connect() {
    this.sortable = Sortable.create(this.element, {
      handle: ".js-sortable-handle",
      animation: 150,
      onEnd: this.end.bind(this)
    })
  }

  async end(event) {
    let cv_id = this.element.dataset.cvId
    let elements = Array.from(document.getElementsByClassName("js-content-block"))
    let dataset = JSON.stringify({
      content_blocks: elements.map((element, index) => {
        return {id: element.dataset.id, position: index + 1 }
      })
    })
    let request = new FetchRequest('patch', `/cvs/${cv_id}/content_blocks/change_position`, { body: dataset})
    let response = await request.perform()
  }

}