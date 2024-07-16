import { Controller } from "@hotwired/stimulus"
import ahoy from "ahoy.js"

ahoy.configure({
  visitsUrl: "/log/visits",
  eventsUrl: "/log/events",
})

// Connects to data-controller="verse-stats"
export default class extends Controller {
  static values = {
    number: Number
  }

  hoverIntentTimeout = null

  connect() {
    this.element.addEventListener('mouseover', this.mouseOver.bind(this))
    this.element.addEventListener('mouseout', this.mouseOut.bind(this))
  }

  disconnect() {
    this.element.removeEventListener('mouseover', this.mouseOver)
    this.element.removeEventListener('mouseout', this.mouseOut)
  }

  mouseOver() {
    this.hoverIntentTimeout = setTimeout(() => {
      ahoy.track("$verse", {verse: this.numberValue, verseStats: true})
    }, 750)
  }

  mouseOut() {
    clearTimeout(this.hoverIntentTimeout)
  }
}
