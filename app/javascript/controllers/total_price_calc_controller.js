import { Controller } from "stimulus"
import OccurrenceOrderChunkIdsPlugin from "webpack/lib/optimize/OccurrenceChunkOrderPlugin"

export default class extends Controller {
  static targets = [ "total", "savings", "amount"]
  static values = { unitPrice: Number }

  connect() {
    console.log('Hello, Stimulus!')
  }

  updatePrice(e) {
    const total = (this.unitPriceValue * this.amountTarget.value).toFixed(2)
    this.totalTarget.innerText = `${total} €`
    // total = (order.amount * offer.initial_price)
  }
}
