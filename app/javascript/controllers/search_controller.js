import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  connect() {
    console.log("Connecting to data-controller");
  }

  submit(_event){
    this.element.requestSubmit();
  }
}
