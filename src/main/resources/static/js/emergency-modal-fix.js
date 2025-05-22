/**
 * Emergency Modal Fix
 * This script directly fixes any modal display issues by bypassing the regular script flow
 * and applying styles directly to the modals.
 */

// Self-executing function for immediate execution
(function () {
  console.log("🚨 Running emergency modal fix");

  // Wait a little after page load to ensure DOM is fully ready
  setTimeout(function () {
    // Get all modals
    const modals = document.querySelectorAll(".modal");
    console.log(`Found ${modals.length} modals to fix`);

    // Fix each modal's styles
    modals.forEach((modal, index) => {
      // Store original display value
      const originalDisplay = getComputedStyle(modal).display;
      console.log(
        `Modal #${index + 1} (${
          modal.id
        }) - original display: ${originalDisplay}`
      );

      // Set inline CSS with !important flags
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

      // Fix modal content container but preserve inner product layout
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
          overflow: auto !important;
          max-height: 80vh !important;
        `
        );

        // Fix the product container to match the site's original styling
        const modalProducts = modalContent.querySelector(".modal-products");
        if (modalProducts) {
          modalProducts.setAttribute(
            "style",
            `
            display: grid !important;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)) !important;
            gap: 25px !important;
            margin-top: 20px !important;
            `
          );
        }
      }

      // Fix close buttons
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
          z-index: 1000001 !important;
        `
        );

        // Set direct click handler
        button.onclick = function (e) {
          e.preventDefault();
          e.stopPropagation();
          hideModal(modal);
          return false;
        };
      });

      // Set direct click handler on modal background
      modal.onclick = function (e) {
        if (e.target === modal) {
          hideModal(modal);
        }
      };
    });

    // Find all category buttons
    const categoryButtons = document.querySelectorAll("[data-category]");
    console.log(`Found ${categoryButtons.length} category buttons to fix`);

    // Fix each button
    categoryButtons.forEach((button, index) => {
      const category = button.getAttribute("data-category");
      const modalId = `${category}-modal`;

      // Set direct click handler
      button.onclick = function (e) {
        e.preventDefault();
        e.stopPropagation();
        showModal(modalId);
        return false;
      };

      // Log the button's setup
      console.log(
        `Button #${
          index + 1
        } for category: ${category} connected to modal: ${modalId}`
      );
    });

    // Provide global test function to show a specific modal
    window.testShowModal = function (category) {
      const modalId = `${category}-modal`;
      showModal(modalId);
    };

    console.log(
      "✅ Emergency modal fix complete - use window.testShowModal('category-name') to test"
    );
  }, 500);

  // Function to directly show a modal
  function showModal(modalId) {
    // Accept both with and without -modal suffix
    const modalElement =
      document.getElementById(modalId) ||
      document.getElementById(`${modalId}-modal`);

    if (!modalElement) {
      console.error(`❌ Modal not found: ${modalId}`);
      return;
    }

    // Hide all modals first
    document.querySelectorAll(".modal").forEach((m) => {
      m.setAttribute(
        "style",
        m.getAttribute("style").replace("display: block", "display: none")
      );
    });

    // Show this modal with important flags
    modalElement.setAttribute(
      "style",
      `
      position: fixed !important;
      top: 0 !important;
      left: 0 !important;
      width: 100% !important;
      height: 100% !important;
      z-index: 999999 !important;
      background-color: rgba(0, 0, 0, 0.5) !important;
      display: block !important;
    `
    );

    // Also add a special class that has display:block !important in CSS
    modalElement.classList.add("modal-visible");

    // Fix the product grid display
    const modalProducts = modalElement.querySelector(".modal-products");
    if (modalProducts) {
      modalProducts.setAttribute(
        "style",
        `
        display: grid !important;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)) !important;
        gap: 25px !important;
        margin-top: 20px !important;
        `
      );

      // Fix each product showcase in the modal
      modalProducts.querySelectorAll(".showcase").forEach((showcase) => {
        // Set proper styling for the product showcase
        showcase.setAttribute(
          "style",
          `
          display: block !important;
          height: auto !important;
          margin: 0 !important;
          padding: 0 !important;
          border-radius: 8px !important;
          box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1) !important;
          background: white !important;
          overflow: hidden !important;
        `
        );

        // Fix showcase content area
        const showcaseContent = showcase.querySelector(".showcase-content");
        if (showcaseContent) {
          showcaseContent.setAttribute(
            "style",
            `
            padding: 15px !important;
            text-align: left !important;
          `
          );
        }

        // Fix showcase banner (product image container)
        const showcaseBanner = showcase.querySelector(".showcase-banner");
        if (showcaseBanner) {
          showcaseBanner.setAttribute(
            "style",
            `
            position: relative !important;
            width: 100% !important;
            height: 250px !important;
            overflow: hidden !important;
            border-radius: 8px 8px 0 0 !important;
            display: block !important;
            margin: 0 !important;
            padding: 0 !important;
          `
          );
        }

        // Fix the product images
        const productImages = showcase.querySelectorAll(".product-img");
        productImages.forEach((img) => {
          img.setAttribute(
            "style",
            `
            width: 100% !important;
            height: 100% !important;
            object-fit: cover !important;
            transition: transform 0.5s !important;
            display: block !important;
          `
          );
        });
      });
    }

    // Prevent scrolling
    document.body.style.overflow = "hidden";

    console.log(`✅ Modal ${modalId} displayed`);
    return modalElement;
  }

  // Function to directly hide a modal
  function hideModal(modalOrId) {
    const modal =
      typeof modalOrId === "string"
        ? document.getElementById(modalOrId) ||
          document.getElementById(`${modalOrId}-modal`)
        : modalOrId;

    if (!modal) {
      console.error("❌ Modal not found");
      return;
    }

    // Hide the modal
    modal.setAttribute(
      "style",
      modal.getAttribute("style").replace("display: block", "display: none")
    );

    // Remove the visible class
    modal.classList.remove("modal-visible");

    // Re-enable scrolling
    document.body.style.overflow = "auto";

    console.log(`✅ Modal ${modal.id} hidden`);
  }
})();
