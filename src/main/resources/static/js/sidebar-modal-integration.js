/**
 * Floating Sidebar Integration for Modals
 * This script ensures that both regular navigation and floating sidebar
 * can properly open modals without conflicts.
 */

document.addEventListener("DOMContentLoaded", function () {
  // Initialize sidebar tooltips
  initSidebarTooltips();

  // Apply modal integrations for sidebar
  applyModalIntegration();
});

/**
 * Initialize tooltips for the floating sidebar
 */
function initSidebarTooltips() {
  const tooltips = document.querySelectorAll(".floating-sidebar .tooltip");

  tooltips.forEach((tooltip) => {
    const parentLink = tooltip.parentElement;

    parentLink.addEventListener("mouseenter", function () {
      tooltip.style.opacity = "1";
      tooltip.style.visibility = "visible";
    });

    parentLink.addEventListener("mouseleave", function () {
      tooltip.style.opacity = "0";
      tooltip.style.visibility = "hidden";
    });
  });
}

/**
 * Apply modal integration to ensure compatibility with floating sidebar and category items
 */
function applyModalIntegration() {
  // Find all category buttons in the floating sidebar
  const sidebarCategoryLinks = document.querySelectorAll(
    ".floating-sidebar [data-category]"
  );

  // Add click handlers to each button with enhanced modal display support
  sidebarCategoryLinks.forEach((link) => {
    link.addEventListener("click", function (e) {
      e.preventDefault();
      const category = this.getAttribute("data-category");

      console.log(`Sidebar link clicked for category: ${category}`);

      // First try using the openCategoryModal function
      if (typeof window.openCategoryModal === "function") {
        window.openCategoryModal(category);

        // Double-check that the modal is actually shown
        setTimeout(() => {
          const modalId = `${category}-modal`;
          const modal = document.getElementById(modalId);
          if (modal && getComputedStyle(modal).display !== "block") {
            console.log(`⚠️ Modal ${modalId} not showing - forcing display`);
            modal.setAttribute(
              "style",
              "display: block !important;" +
                "position: fixed !important;" +
                "z-index: 999999 !important;" +
                "top: 0 !important;" +
                "left: 0 !important;" +
                "width: 100% !important;" +
                "height: 100% !important;" +
                "background-color: rgba(0, 0, 0, 0.5) !important;"
            );
          }
        }, 50);
      } else {
        console.error("openCategoryModal function not found");

        // Fallback for direct modal opening
        const modalId = `${category}-modal`;
        const modal = document.getElementById(modalId);
        if (modal) {
          modal.setAttribute(
            "style",
            "display: block !important;" +
              "position: fixed !important;" +
              "z-index: 999999 !important;" +
              "top: 0 !important;" +
              "left: 0 !important;" +
              "width: 100% !important;" +
              "height: 100% !important;" +
              "background-color: rgba(0, 0, 0, 0.5) !important;"
          );
          document.body.style.overflow = "hidden";
        }
      }

      return false;
    });
  });

  // Fix regular category buttons with data-category attributes
  const categoryButtons = document.querySelectorAll(
    ".category-btn[data-category]"
  );
  categoryButtons.forEach((button) => {
    button.addEventListener("click", function (e) {
      e.preventDefault();
      const category = this.getAttribute("data-category");
      if (category && typeof window.openCategoryModal === "function") {
        window.openCategoryModal(category);
      }
      return false;
    });
  });

  // Also handle onclick handlers that directly call openCategoryModal
  const categoryBtnsWithOnclick = document.querySelectorAll(
    ".category-btn:not([data-category])"
  );
  categoryBtnsWithOnclick.forEach((button) => {
    const onclickAttr = button.getAttribute("onclick");
    if (onclickAttr && onclickAttr.includes("openCategoryModal")) {
      // Extract the category from the onclick
      const match = /openCategoryModal\(['"]([^'"]+)['"]\)/.exec(onclickAttr);
      if (match && match[1]) {
        const category = match[1];
        // Add a data-category attribute for consistent behavior
        button.setAttribute("data-category", category);

        // Replace with our event handler
        button.removeAttribute("onclick");
        button.addEventListener("click", function (e) {
          e.preventDefault();
          if (typeof window.openCategoryModal === "function") {
            window.openCategoryModal(category);
          }
          return false;
        });
      }
    }
  });

  console.log(
    "✅ Modal integration with both floating sidebar and category items completed"
  );
}
