import { Controller } from "stimulus"
import OccurrenceOrderChunkIdsPlugin from "webpack/lib/optimize/OccurrenceChunkOrderPlugin"

export default class extends Controller {
  static targets = ["total", "savings", "amount", "text", "congratulation"]
  static values = { unitPrice: Number, targetPrice: Number, targetAmount: Number, currentAmount: Number }

  reachedPrice() {
    const total = (this.targetPriceValue * this.amountTarget.value).toFixed(2)
    this.totalTarget.innerText = `${total} €`
    const savings = ((this.unitPriceValue - this.targetPriceValue) * this.amountTarget.value).toFixed(2)
    console.log(this.amountTarget.value)
    this.savingsTarget.innerText = `${savings} €`
    this.textTarget.innerText = "You will be saving"
    this.congratulationTarget.innerText = `Yaaay! By ordering ${this.amountTarget.value} units we reached the target!`
  }
  updatePrice() {
    const total = (this.unitPriceValue * this.amountTarget.value).toFixed(2)
    this.totalTarget.innerText = `${total} €`
    const savings = (total - (this.targetPriceValue * this.amountTarget.value)).toFixed(2)
    this.textTarget.innerText = "You could be saving"
    this.savingsTarget.innerText = `${savings} €`
    this.congratulationTarget.innerText = ""
    if ((parseInt(this.amountTarget.value) + this.currentAmountValue) >= this.targetAmountValue) {

      this.reachedPrice()
    }
  }


}
