/**
 * Modal Debug Script
 * This script helps detect issues with modal functionality.
 * It can be safely removed after confirming modals work correctly.
 */

(function () {
  // Wait for DOM to be loaded
  document.addEventListener("DOMContentLoaded", function () {
    console.log("🔍 Modal Debug Tool Initialized");

    // Test if modal functions exist
    console.log(
      "✅ openCategoryModal exists:",
      typeof window.openCategoryModal === "function"
    );
    console.log(
      "✅ closeModal exists:",
      typeof window.closeModal === "function"
    );

    // Check if we have modal elements
    const modals = document.querySelectorAll(".modal");
    console.log(`✅ Found ${modals.length} modals on the page`);

    // Check if category buttons are properly set up - both sidebar and main category items
    const sidebarCategoryButtons = document.querySelectorAll(
      ".floating-sidebar [data-category]"
    );
    console.log(
      `✅ Found ${sidebarCategoryButtons.length} category buttons in sidebar`
    );

    const mainCategoryButtons = document.querySelectorAll(
      ".category-btn[data-category]"
    );
    console.log(
      `✅ Found ${mainCategoryButtons.length} category buttons in main content`
    );

    // Check onclick handlers too
    const onclickButtons = document.querySelectorAll(
      '.category-btn:not([data-category])[onclick*="openCategoryModal"]'
    );
    console.log(
      `ℹ️ Found ${onclickButtons.length} category buttons with direct onclick handlers`
    );

    // Log all category buttons and their corresponding modals
    console.group("Category Button to Modal Mapping");

    const allCategoryButtons = [
      ...sidebarCategoryButtons,
      ...mainCategoryButtons,
    ];
    allCategoryButtons.forEach((button) => {
      const category = button.getAttribute("data-category");
      const modalId = `${category}-modal`;
      const modalExists = document.getElementById(modalId) !== null;
      const buttonLocation = button.closest(".floating-sidebar")
        ? "sidebar"
        : "main content";
      console.log(
        `${category} (${buttonLocation}) → ${modalId}: ${
          modalExists ? "✅ Found" : "❌ Missing"
        }`
      );
    });

    // Also check onclick buttons
    onclickButtons.forEach((button) => {
      const onclickAttr = button.getAttribute("onclick");
      const match = /openCategoryModal\(['"]([^'"]+)['"]\)/.exec(onclickAttr);
      if (match && match[1]) {
        const category = match[1];
        const modalId = `${category}-modal`;
        const modalExists = document.getElementById(modalId) !== null;
        console.log(
          `${category} (onclick) → ${modalId}: ${
            modalExists ? "✅ Found" : "❌ Missing"
          }`
        );
      }
    });

    console.groupEnd();

    // Test modals directly
    const allModals = document.querySelectorAll(".modal");
    console.log(`✅ Found ${allModals.length} modals in the document`);

    console.group("Available Modals");
    allModals.forEach((modal) => {
      console.log(`${modal.id}`);
    });
    console.groupEnd();

    // Add debug info to console
    console.group("Modal Debug Information");
    console.log(
      "📱 Floating sidebar active:",
      document.querySelector(".floating-sidebar") !== null
    );
    console.log("📏 Window width:", window.innerWidth);
    console.log(
      "📏 Body padding-left:",
      getComputedStyle(document.body).paddingLeft
    );
    console.groupEnd();

    // Add keypress listener for testing
    document.addEventListener("keydown", function (event) {
      // Ctrl+Shift+M opens modal debug panel
      if (event.ctrlKey && event.shiftKey && event.key === "M") {
        showModalDebugInfo();
      }
    });
  });

  function showModalDebugInfo() {
    console.log("🔍 Running modal diagnostic tests...");

    // Test modal visibility
    const modals = document.querySelectorAll(".modal");
    modals.forEach((modal) => {
      console.log(`Modal #${modal.id}: ${getComputedStyle(modal).display}`);

      // Check z-index
      console.log(
        `Modal #${modal.id} z-index: ${getComputedStyle(modal).zIndex}`
      );

      // Check position
      console.log(
        `Modal #${modal.id} position: ${getComputedStyle(modal).position}`
      );
    });

    // Alert user
    alert("Modal debug info logged to console. Press F12 to view.");
  }
})();
