/**
 * floating-sidebar.js - Functionality for the floating sidebar with tooltips
 */

document.addEventListener("DOMContentLoaded", function () {
  // Floating sidebar dropdown functionality
  const floatingDropdownBtn = document.querySelector(
    ".floating-sidebar .mobile-menu-dropdown-btn"
  );
  if (floatingDropdownBtn) {
    floatingDropdownBtn.addEventListener("click", function (event) {
      event.stopPropagation(); // Prevent event bubbling
      const parentItem = this.closest(".mobile-menu-dropdown");
      if (parentItem) {
        parentItem.classList.toggle("active");
      }

      // Close dropdown when clicking outside
      document.addEventListener("click", function closeDropdown(e) {
        if (
          !e.target.closest(".floating-sidebar .mobile-menu-dropdown") &&
          !e.target.classList.contains("mobile-menu-dropdown-btn")
        ) {
          document
            .querySelectorAll(".floating-sidebar .mobile-menu-dropdown")
            .forEach((dropdown) => {
              dropdown.classList.remove("active");
            });
          document.removeEventListener("click", closeDropdown);
        }
      });
    });
  }

  // Animation for sidebar icons on hover
  const sidebarLinks = document.querySelectorAll(
    ".floating-sidebar .sidebar-nav-link"
  );
  sidebarLinks.forEach((link) => {
    link.addEventListener("mouseenter", function () {
      const tooltip = this.querySelector(".tooltip");
      if (tooltip) {
        tooltip.style.visibility = "visible";
        tooltip.style.opacity = "1";
      }
    });

    link.addEventListener("mouseleave", function () {
      const tooltip = this.querySelector(".tooltip");
      if (tooltip) {
        tooltip.style.visibility = "hidden";
        tooltip.style.opacity = "0";
      }
    });
  });
});
