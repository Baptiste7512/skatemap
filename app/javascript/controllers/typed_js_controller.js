import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ['<h3>Sur ce site vous pourrais aussi trouver une page interractive avec canal de conversation afin de pouvoir communiquer et organiser des sessions</h3>'],
      typeSpeed: 25,
      loop: false
    })
  }
}
