/**
 * Category-Modal Integration Verification
 * This script automatically tests if all category buttons can properly open their
 * corresponding modals, and logs the results. Remove after testing is complete.
 */

document.addEventListener("DOMContentLoaded", function () {
  // Wait a bit for all other scripts to initialize
  setTimeout(verifyModalIntegration, 1000);
});

function verifyModalIntegration() {
  console.group("🧪 Category-Modal Integration Verification");
  console.log("Running automatic tests for modal integration...");

  // Step 1: Check if the openCategoryModal function exists
  if (typeof window.openCategoryModal !== "function") {
    console.error("❌ openCategoryModal function is not defined!");
    console.groupEnd();
    return;
  }
  console.log("✅ openCategoryModal function exists");

  // Step 2: Find all category buttons (both sidebar and main content)
  const allCategoryButtons = [
    ...document.querySelectorAll(".floating-sidebar [data-category]"),
    ...document.querySelectorAll(".category-btn[data-category]"),
  ];

  console.log(
    `Found ${allCategoryButtons.length} category buttons with data-category attribute`
  );

  // Step 3: Test each button by simulating a click
  allCategoryButtons.forEach((button, index) => {
    const category = button.getAttribute("data-category");
    const modalId = `${category}-modal`;
    const modal = document.getElementById(modalId);

    console.group(`Testing ${category} button`);

    if (!modal) {
      console.error(`❌ Modal with ID ${modalId} not found!`);
      console.groupEnd();
      return;
    }

    console.log(`✅ Modal #${modalId} exists`);

    // Check modal's display style before opening
    const displayBefore = modal.style.display;
    console.log(`Modal display before: "${displayBefore}"`);

    // Try to open the modal
    try {
      window.openCategoryModal(category);
      console.log(`✅ Successfully called openCategoryModal('${category}')`);

      // Wait briefly to ensure styles propagate, then verify modal display
      setTimeout(() => {
        // Check both inline style and computed style
        const computedDisplay = getComputedStyle(modal).display;
        console.log(
          `Modal #${modalId} - inline display: "${modal.style.display}", computed display: "${computedDisplay}"`
        );

        if (computedDisplay !== "block") {
          console.error(
            `❌ Modal didn't open! Computed display is: "${computedDisplay}"`
          );

          // Try manual override as a test
          console.log("⚙️ Testing manual style override...");
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
        } else {
          console.log(
            `✅ Modal opened successfully! Computed display is: "${computedDisplay}"`
          );
        }
      }, 50);

      // Close the modal after checking display status
      setTimeout(() => {
        if (typeof window.closeModal === "function") {
          window.closeModal(modalId);
          console.log(`Modal closed for next test`);
        } else {
          // Fallback close method
          modal.setAttribute("style", "display: none !important;");
          document.body.style.overflow = "auto";
          console.log(`Modal closed using fallback method`);
        }
      }, 300);
    } catch (error) {
      console.error(`❌ Error opening modal: ${error.message}`);
    }

    console.groupEnd();

    // Add small delay between tests to avoid UI glitches
    // Only in testing - do not use in production code
  });

  console.log("✅ Modal integration verification complete");
  console.groupEnd();
}
