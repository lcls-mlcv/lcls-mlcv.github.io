(function () {
  const storageKey = "theme";
  const root = document.documentElement;

  function preferredTheme() {
    const stored = window.localStorage.getItem(storageKey);
    if (stored === "light" || stored === "dark") return stored;
    return window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
  }

  function applyTheme(theme) {
    root.setAttribute("data-theme", theme);
    document.querySelectorAll("[data-theme-toggle]").forEach((button) => {
      const label = theme === "dark" ? "Switch to light mode" : "Switch to dark mode";
      button.setAttribute("aria-label", label);
      button.setAttribute("title", label);
    });
  }

  applyTheme(preferredTheme());

  document.addEventListener("DOMContentLoaded", function () {
    applyTheme(preferredTheme());

    document.querySelectorAll("[data-theme-toggle]").forEach((button) => {
      button.addEventListener("click", function () {
        const next = root.getAttribute("data-theme") === "dark" ? "light" : "dark";
        window.localStorage.setItem(storageKey, next);
        applyTheme(next);
      });
    });

    document.querySelectorAll("[data-abstract-toggle]").forEach((button) => {
      button.addEventListener("click", function () {
        const target = document.getElementById(button.getAttribute("aria-controls"));
        if (!target) return;
        const expanded = button.getAttribute("aria-expanded") === "true";
        button.setAttribute("aria-expanded", String(!expanded));
        target.hidden = expanded;
      });
    });

    document.querySelectorAll("[data-toggle-nav]").forEach((button) => {
      button.addEventListener("click", function () {
        const nav = document.getElementById("site-nav");
        if (nav) nav.classList.toggle("open");
      });
    });
  });
})();
