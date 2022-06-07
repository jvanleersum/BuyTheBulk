import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["commentForm", "commentList", "button"]
  connect() {

  }
  postComment (e) {
    e.preventDefault();
    // console.log(new FormData(this.commentFormTarget))
    fetch(this.commentFormTarget.action, {
      method: 'POST',
      headers: { 'Accept': 'application/json' },
      body: new FormData(this.commentFormTarget),
    })
    .then(response => response.json())
    .then( (data) => {
      console.log(data.message_html)

      this.commentListTarget.insertAdjacentHTML('beforeend', data.message_html);
      this.buttonTarget.removeAttribute("disabled");
    });
    this.commentFormTarget[1].value = "";
  }
}
