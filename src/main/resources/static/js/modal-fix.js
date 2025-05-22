/**
 * Modal Fix Script
 * This script properly implements the openCategoryModal function to fix the modal opening functionality.
 * It runs before modal-unified.js to ensure compatibility with the floating sidebar.
 */

// Store the original openCategoryModal function if it exists
const originalOpenCategoryModal = window.openCategoryModal;

// Enhanced openCategoryModal function that works with both category items and floating sidebar
window.openCategoryModal = function (categoryId) {
  console.log(`🔧 Fixed modal opener for category: ${categoryId}`);

  // Prevent default behavior if called from an event
  if (event) {
    event.preventDefault();
    event.stopPropagation();
  }

  // Get the modal element - handle both cases with and without -modal suffix
  let modalId = categoryId.endsWith("-modal")
    ? categoryId
    : `${categoryId}-modal`;
  let modal = document.getElementById(modalId);

  // If not found, try without the -modal suffix
  if (!modal && modalId.endsWith("-modal")) {
    modalId = categoryId;
    modal = document.getElementById(modalId);
  }

  if (!modal) {
    console.error(`Modal with ID ${modalId} not found`);
    return false;
  }

  // Close any open modals first
  document.querySelectorAll(".modal").forEach((m) => {
    m.style.display = "none";
  });

  // Show the modal with improved styling - use setAttribute for stronger style application
  console.log(`🔍 Opening modal #${modalId}`);

  // Set inline styles with !important to override any other styles
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

  // Log that the modal should now be visible
  console.log(`Modal #${modalId} display style is now: ${modal.style.display}`);

  // Prevent body scrolling when modal is open
  document.body.style.overflow = "hidden";
  document.body.classList.add("modal-open");

  // Setup close button handlers
  setupModalCloseHandlers(modal);

  // Load products if needed
  if (window.loadCategoryProducts) {
    console.log(`Using loadCategoryProducts function for ${categoryId}`);
    window.loadCategoryProducts(categoryId);
  } else if (window.loadProductsForCategory) {
    console.log(`Using loadProductsForCategory function for ${categoryId}`);
    window.loadProductsForCategory(categoryId, modal);
  }

  return false; // Prevent default behavior
};

// Function to close a modal
window.closeModal = function (modalId) {
  try {
    const modal =
      typeof modalId === "string" ? document.getElementById(modalId) : modalId;

    if (!modal) {
      return;
    }

    // Hide modal with !important flag
    modal.setAttribute("style", "display: none !important;");

    // Re-enable scrolling
    document.body.style.overflow = "auto";
    document.body.classList.remove("modal-open");
  } catch (err) {
    // Fallback: try to hide all modals on error using stronger style application
    document.querySelectorAll(".modal").forEach((m) => {
      m.setAttribute("style", "display: none !important;");
    });
    document.body.style.overflow = "auto";
    document.body.classList.remove("modal-open");
  }
};

// Setup consistent close handlers
function setupModalCloseHandlers(modal) {
  // Handle close button clicks
  const closeButtons = modal.querySelectorAll(".close-modal");
  closeButtons.forEach((button) => {
    button.onclick = function (e) {
      e.preventDefault();
      e.stopPropagation();
      closeModal(modal.id);
      return false;
    };
  });

  // Close when clicking outside
  window.onclick = function (event) {
    if (event.target === modal) {
      closeModal(modal);
    }
  };

  // Close when pressing Escape
  document.onkeydown = function (event) {
    if (event.key === "Escape" || event.keyCode === 27) {
      closeModal(modal);
    }
  };
}

// When the page loads, set up all modals
document.addEventListener("DOMContentLoaded", function () {
  // Get all modals
  const modals = document.querySelectorAll(".modal");

  // Set up close buttons for each modal
  modals.forEach((modal) => {
    // Ensure modals have proper styling for visibility with floating sidebar
    // Use setAttribute for stronger style application with !important
    console.log(`Setting up modal: ${modal.id}`);
    modal.setAttribute(
      "style",
      `
      position: fixed !important;
      top: 0 !important;
      left: 0 !important;
      width: 100% !important;
      height: 100% !important;
      z-index: 999999 !important;
      background-color: rgba(0, 0, 0, 0.5) !important;
      display: none !important;
    `
    );

    // Fix the modal content positioning using setAttribute for stronger styles
    const modalContent = modal.querySelector(".modal-content");
    if (modalContent) {
      modalContent.setAttribute(
        "style",
        `
        position: relative !important;
        z-index: 1000000 !important;
        margin: 10% auto !important; 
        width: 85% !important;
        max-width: 900px !important;
        background-color: #ffffff !important;
        border-radius: 10px !important;
        padding: 25px !important;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3) !important;
      `
      );
    }

    // Set up close buttons with stronger style application
    const closeButtons = modal.querySelectorAll(".close-modal");
    closeButtons.forEach((button) => {
      button.setAttribute(
        "style",
        `
        position: absolute !important;
        top: 15px !important;
        right: 20px !important;
        font-size: 28px !important;
        cursor: pointer !important;
      `
      );

      button.onclick = function (e) {
        e.preventDefault();
        e.stopPropagation();
        closeModal(modal.id);
        return false;
      };
    });

    // Close modal when clicking outside the content
    modal.onclick = function (event) {
      if (event.target === modal) {
        closeModal(modal.id);
      }
    };
  });

  // Set up category buttons in the floating sidebar
  const sidebarCategoryButtons = document.querySelectorAll(
    ".floating-sidebar a[data-category]"
  );
  sidebarCategoryButtons.forEach((button) => {
    button.onclick = function (event) {
      event.preventDefault();
      const category = button.getAttribute("data-category");
      if (category) {
        openCategoryModal(category);
      }
      return false;
    };
  });

  // Set up regular category buttons
  const categoryButtons = document.querySelectorAll(
    "[data-category]:not(.floating-sidebar *)"
  );
  categoryButtons.forEach((button) => {
    button.onclick = function (event) {
      event.preventDefault();
      const category = button.getAttribute("data-category");
      if (category) {
        openCategoryModal(category);
      }
      return false;
    };
  });

  console.log(
    "✅ Modal functionality enhanced for floating sidebar compatibility"
  );
});
