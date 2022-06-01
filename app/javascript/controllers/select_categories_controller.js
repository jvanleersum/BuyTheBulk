import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "category", "form", "hiddenField" ]

  // connect() {
  //   console.log("Hello from our first Stimulus controller")
  // }

  selectCategory(event) {
    if (event.currentTarget.classList.contains("selected")) {
      event.currentTarget.classList.remove("selected")
      this.hiddenFieldTarget.value = ""
    } else {
      event.currentTarget.classList.add("selected")
      if (this.hiddenFieldTarget.value == "all") {
        this.hiddenFieldTarget.value = event.currentTarget.innerText
      } else {
      this.hiddenFieldTarget.value += `-${event.currentTarget.innerText}`
      }
    } 
  }
}
