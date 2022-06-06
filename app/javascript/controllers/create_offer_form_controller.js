import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "back", "next", "dot1", "dot2", "dot3", "form1", "form2", "form3", "submit" ]

  connect() {
    this.currentIndex = 0;
    console.log(this.backTarget)
    console.log(this.nextTarget)
    console.log(this.dot1Target)
    console.log(this.dot2Target)
    console.log(this.dot3Target)
    console.log(this.form1Target)
    console.log(this.form2Target)
    console.log(this.form3Target)
  }

  back() {
    if (this.form2Target.classList.contains("active")) {
      console.log("back to section 1")
      this.form1Target.classList.remove("hidden")
      this.form1Target.classList.add("active")
      this.form2Target.classList.remove("active")
      this.form2Target.classList.add("hidden")

      this.backTarget.classList.add("hidden")

      this.dot1Target.classList.remove("far")
      this.dot1Target.classList.add("active")
      this.dot1Target.classList.add("fas")

      this.dot2Target.classList.remove("fas")
      this.dot2Target.classList.remove("active")
      this.dot2Target.classList.add("far")
    } else if (this.form3Target.classList.contains("active")) {
      console.log("back to section 2")
      this.form2Target.classList.remove("hidden")
      this.form2Target.classList.add("active")
      this.form3Target.classList.remove("active")
      this.form3Target.classList.add("hidden")

      this.nextTarget.classList.remove("hidden")

      this.dot2Target.classList.remove("far")
      this.dot2Target.classList.add("active")
      this.dot2Target.classList.add("fas")

      this.dot3Target.classList.remove("fas")
      this.dot3Target.classList.remove("active")
      this.dot3Target.classList.add("far")
    }
  }

  next() {
    if (this.form1Target.classList.contains("active")) {
      console.log("go to section 2")
      this.backTarget.classList.remove("hidden")
      this.form2Target.classList.remove("hidden")
      this.form2Target.classList.add("active")
      this.form1Target.classList.remove("active")
      this.form1Target.classList.add("hidden")

      this.dot2Target.classList.remove("far")
      this.dot2Target.classList.add("active")
      this.dot2Target.classList.add("fas")

      this.dot1Target.classList.remove("fas")
      this.dot1Target.classList.remove("active")
      this.dot1Target.classList.add("far")
    } else if (this.form2Target.classList.contains("active")) {
      console.log("go to section 3")
      this.form3Target.classList.remove("hidden")
      this.form3Target.classList.add("active")
      this.form2Target.classList.remove("active")
      this.form2Target.classList.add("hidden")

      this.nextTarget.classList.add("hidden")

      this.dot3Target.classList.remove("far")
      this.dot3Target.classList.add("active")
      this.dot3Target.classList.add("fas")

      this.dot2Target.classList.remove("fas")
      this.dot2Target.classList.remove("active")
      this.dot2Target.classList.add("far")

      this.submitTarget.removeAttribute("disabled")
    }
  }
}


