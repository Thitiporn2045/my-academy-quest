import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
static targets = ["display", "form"]

connect() {
    this.element.addEventListener("click", this.goToShow.bind(this))
}

goToShow(event) {
    // คลิก checkbox หรือปุ่มลบ → ไม่ต้องไปหน้า show
    if (event.target.closest("form") || event.target.closest("button")) {
    return
    }

    // อ่าน URL จาก data-task-url แล้วไปหน้า Show
    const url = this.element.dataset.taskUrl
    if (url) {
    window.location.href = url
    }
}

// กรณีแก้ไขชื่อภายหลัง
toggleEdit(event) {
    if (event.target.closest("form") || event.target.closest("button")) return
    this.displayTarget.classList.add("hidden")
    this.formTarget.classList.remove("hidden")
}

cancelEdit() {
    this.displayTarget.classList.remove("hidden")
    this.formTarget.classList.add("hidden")
}
}
