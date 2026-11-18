import { Controller } from "@hotwired/stimulus"

// Filtros rápidos da lista de alunos (Todos / Ativos / Inativos / Vencendo).
// Filtra as linhas já carregadas, sem nova requisição ao servidor.
const EXPIRING_DAYS = 7

export default class extends Controller {
  static targets = ["button", "row", "count", "empty"]
  static values = { current: { type: String, default: "todos" } }

  // Chamado ao clicar em um botão (data-filter-filter-param="ativos", etc.)
  select({ params: { filter } }) {
    this.currentValue = filter
  }

  // Roda sempre que o filtro muda
  currentValueChanged() {
    this.buttonTargets.forEach((button) => {
      const active = button.dataset.filterFilterParam === this.currentValue
      button.classList.toggle("filter-btn--active", active)
      button.setAttribute("aria-pressed", active)
    })
    this.apply()
  }

  // A busca troca a tabela (turbo-frame): reaplica o filtro nas novas linhas
  rowTargetConnected() {
    cancelAnimationFrame(this.frame)
    this.frame = requestAnimationFrame(() => this.apply())
  }

  apply() {
    let visible = 0

    this.rowTargets.forEach((row) => {
      const show = this.matches(row)
      row.hidden = !show
      if (show) visible++
    })

    if (this.hasCountTarget) this.countTarget.textContent = visible
    if (this.hasEmptyTarget) this.emptyTarget.hidden = visible > 0
  }

  matches(row) {
    const { status } = row.dataset
    const days = Number(row.dataset.days)

    switch (this.currentValue) {
      case "ativos":
        return status === "ativo"
      case "inativos":
        return status === "inativo"
      case "vencendo":
        return status === "ativo" && days <= EXPIRING_DAYS
      default:
        return true
    }
  }
}
