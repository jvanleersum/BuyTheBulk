import { Controller } from "stimulus"
import OccurrenceOrderChunkIdsPlugin from "webpack/lib/optimize/OccurrenceChunkOrderPlugin"

export default class extends Controller {
  static targets = [ "total", "savings", "amount"]
  static values = { unitPrice: Number, targetPrice: Number}

  updatePrice(e) {
    const total = (this.unitPriceValue * this.amountTarget.value).toFixed(2)
    this.totalTarget.innerText = `${total} €`
    const savings = (total - (this.targetPriceValue * this.amountTarget.value)).toFixed(2)

    this.savingsTarget.innerText = `${savings} €`
  }
  reachedPrice(e){
    const total = (this.targetPriceValue * this.amountTarget.value).toFixed(2)
    this.totalTarget.innerText = `${total} €`
    const savings = ((this.unitPriceValue -this.targetPriceValue) * this.amountTarget.value).toFixed(2)

    this.savingsTarget.innerText = `${savings} €`
  }


}
