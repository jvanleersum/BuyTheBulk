import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "button" ]

  // connect() {
  //   console.log(this.buttonTarget)
  // }

  clicked() {
    this.buttonTarget.innerHTML = '<i class="fas fa-clipboard-check"></i>'
  }
}
