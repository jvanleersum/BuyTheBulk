import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = [ "buttons"]

  connect() {
    console.log(this.buttonsTarget)
  }

  accept(e) {
    e.preventDefault();
    console.log(e.currentTarget.href)
    fetch(e.currentTarget.href, { 
      method: 'PATCH',
      headers: { Accept: 'application/json', "X-CSRF-Token": csrfToken() }
    })
      .then(res => res.json())
      .then(data => {
        this.buttonsTarget.innerHTML = data.expired_buttons
      })
  }

  reject(e) {
    e.preventDefault();
    console.log(e.currentTarget.href)
    fetch(e.currentTarget.href, { 
      method: 'PATCH',
      headers: { Accept: 'application/json', "X-CSRF-Token": csrfToken() }
    })
      .then(res => res.json())
      .then(data => {
        this.buttonsTarget.innerHTML = data.expired_buttons
      })
  }

}