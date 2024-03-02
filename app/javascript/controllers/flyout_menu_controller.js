import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['menu'];

  connect() {}

  toogleMenu() {
    this.menuTarget.classList.toggle('hidden');
  }

  closeWithKeyboard(e) {
    if (e.code === 'Escape') {
      this.menuTarget.classList.add('hidden');
    }
  }

  closeBackground(e) {
    if (
      e &&
      (this.menuTarget.contains(e.target) || this.element.contains(e.target))
    ) {
      return;
    }

    this.menuTarget.classList.add('hidden');
  }
}
