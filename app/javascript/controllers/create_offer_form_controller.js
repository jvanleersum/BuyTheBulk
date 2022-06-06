import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "back", "next", "dot", "form", "submit" ]

  connect() {
    this.currentIndex = 0;
  }

  checkLabels(){
    // update arrows
    if (this.currentIndex == this.formTargets.length - 1) {
      this.submitTarget.removeAttribute("disabled")
      this.nextTarget.classList.add("hidden")
    } else {
      this.nextTarget.classList.remove("hidden")
    }
    if (this.currentIndex == 0) {
      this.backTarget.classList.add("hidden")
    } else {
      this.backTarget.classList.remove("hidden")
    }

    // update dots
    this.dotTargets.forEach(dot => {
      if (dot.classList.contains("active")){
        dot.classList.remove("active")
        dot.classList.remove("fas")
        dot.classList.add("far")
      }
    })
    this.dotTargets[this.currentIndex].classList.remove('far')
    this.dotTargets[this.currentIndex].classList.add('fas')
    this.dotTargets[this.currentIndex].classList.add('active')
  }

  back() {
    if (this.currentIndex > 0) {
      this.currentIndex -= 1
      this.formTargets.forEach(form => {
        if (!form.classList.contains('hidden')) {
          form.classList.add('hidden') 
        }
      })
      this.formTargets[this.currentIndex].classList.remove('hidden')
    }
    this.checkLabels()
  }

  next() {
    if (this.currentIndex < this.formTargets.length - 1) {
      this.currentIndex += 1
      this.formTargets.forEach(form => {
        if (!form.classList.contains('hidden')) {
          form.classList.add('hidden') 
        }
      })
      this.formTargets[this.currentIndex].classList.remove('hidden')
    }
    this.checkLabels()
  }

  selectDot(e){
    console.log(e)
  }
}


